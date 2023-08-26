Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7861111404701905971=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Date: Sat, 26 Aug 2023 06:26:58 -0000
Message-ID: <169303121820.6795.728570901982837893@emeril.freedesktop.org>
References: <20230825131913.600667-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230825131913.600667-1-marcin.bernatowicz@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgYmVuY2ht?=
 =?utf-8?q?arks/gem=5Fwsim=3A_added_basic_xe_support?=
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

--===============7861111404701905971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/gem_wsim: added basic xe support
URL   : https://patchwork.freedesktop.org/series/122920/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13568_full -> IGTPW_9663_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between CI_DRM_13568_full and IGTPW_9663_full:

### New IGT tests (35) ###

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@bo-too-big-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@bo-too-big-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@bo-too-big-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@bo-too-big@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@bo-too-big@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@bo-too-big@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_rmfb@close-fd@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9663_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][1] ([i915#8411]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#8411]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#7701])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][4] ([i915#7742])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414]) +9 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8414])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_mm@drm_mm_test:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#8661])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb5/igt@drm_mm@drm_mm_test.html
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8661])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@drm_mm@drm_mm_test.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#658]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#658]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@feature_discovery@psr1.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#4873]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_caching@writes.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8562])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [PASS][14] -> [FAIL][15] ([i915#6121])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1099]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@in-flight-10ms:
    - shard-mtlp:         NOTRUN -> [ABORT][18] ([i915#8503])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][19] -> [FAIL][20] ([i915#5784])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-8/igt@gem_eio@reset-stress.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#4771])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#4771])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4812])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#6334])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#6344])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2846])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-rkl:          [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4473] / [i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4812])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#3281]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3281]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@noreorder-priority@rcs0:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][36] ([i915#9121])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_exec_schedule@noreorder-priority@rcs0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4860])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4860]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#2190])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4613]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#4613])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][43] ([i915#5493])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4083]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4077])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4077]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4077]) +10 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4083]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3282]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3282])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-17/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3282]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4270]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4270])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3282]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#8428]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4079]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([fdo#109312])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3297] / [i915#4880])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#3297])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3297]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3297]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([fdo#109289]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gen7_exec_parse@basic-offset.html
    - shard-rkl:          NOTRUN -> [SKIP][63] ([fdo#109289])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][64] -> [ABORT][65] ([i915#5566])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#2856]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#2527])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#2856]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [PASS][69] -> [FAIL][70] ([i915#8456]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         NOTRUN -> [ABORT][71] ([i915#8489] / [i915#8668])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3546] / [i915#7561])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-3/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5354] / [i915#7561])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@i915_pm_backlight@fade-with-suspend.html
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][74] ([fdo#103375] / [i915#6311])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5978])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][76] -> [SKIP][77] ([fdo#109271])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-apl4/igt@i915_pm_dc@dc9-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#6590])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([fdo#109289]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][80] -> [SKIP][81] ([i915#1397])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-1/igt@i915_pm_rpm@modeset-non-lpsp.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][82] -> [SKIP][83] ([i915#1397]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#1397])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4387])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@migrate:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][86] ([i915#7699])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@i915_selftest@live@migrate.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-snb:          NOTRUN -> [DMESG-WARN][87] ([i915#8841]) +6 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8502]) +11 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#8502]) +7 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#1769] / [i915#3555])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#5286])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][92] -> [FAIL][93] ([i915#5138])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([fdo#111614])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([fdo#111615] / [i915#5286])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][96] ([i915#5138])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([fdo#111614]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([fdo#111614] / [i915#3638])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          [PASS][99] -> [FAIL][100] ([i915#3743])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         [PASS][101] -> [FAIL][102] ([i915#3743])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#6187])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([fdo#111615]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#5190]) +7 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4538] / [i915#5190]) +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([fdo#110723]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-tglu:         NOTRUN -> [SKIP][108] ([fdo#111615])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#6095]) +17 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3689] / [i915#5354] / [i915#6095])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#5354] / [i915#6095]) +6 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3886] / [i915#6095]) +5 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3689] / [i915#5354]) +11 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#3689] / [i915#3886] / [i915#5354]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5354] / [i915#6095]) +7 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5354]) +9 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#4087]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([fdo#111827])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-rkl:          NOTRUN -> [SKIP][123] ([fdo#111827])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#7828])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#7828]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#7828]) +7 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#7828]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#7118]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#3299])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#8063])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][131] ([i915#7173])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#7118] / [i915#7162])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#3359]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#8814]) +3 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#3359])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([fdo#111767] / [fdo#111825])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([fdo#111767] / [i915#3546])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3546]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([fdo#109274] / [i915#5354]) +3 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][141] ([fdo#111825]) +4 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [PASS][142] -> [FAIL][143] ([i915#2346])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][144] -> [FAIL][145] ([i915#2346])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4103] / [i915#4213]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#3840])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [PASS][148] -> [FAIL][149] ([fdo#103375]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([fdo#109274] / [i915#3637])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([fdo#111767] / [i915#3637])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([fdo#109274]) +6 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([fdo#109274] / [fdo#111767])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
    - shard-snb:          NOTRUN -> [SKIP][154] ([fdo#109271] / [fdo#111767])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3637])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#8381])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#2672])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#2672]) +4 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#2672])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#8708]) +9 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#5354]) +40 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#111825] / [i915#1825]) +14 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3023]) +6 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#8708]) +4 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([fdo#109280]) +4 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#5439])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#5460])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3458]) +10 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#1825]) +10 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-mtlp:         [PASS][170] -> [FAIL][171] ([fdo#103375])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-suspend.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#8228])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#8228])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_hdr@static-swap.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#6301])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][175] ([fdo#103375])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-mtlp:         [PASS][176] -> [FAIL][177] ([i915#1623])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8821])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8821])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3555]) +2 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-dp-2:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5176]) +7 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-dp-2.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#5176]) +5 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#5176]) +7 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#5176]) +11 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#5235]) +11 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5235]) +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#5235]) +19 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][188] ([fdo#109271]) +249 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#5235]) +7 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#4348]) +1 similar issue
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#1072]) +2 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([fdo#110189]) +5 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@sprite_blt:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#1072]) +6 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_psr@sprite_blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#5461] / [i915#658])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#4235])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([fdo#111615] / [i915#5289])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_selftest@drm_plane:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#8661])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_selftest@drm_plane.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#4098])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][199] ([IGT#2])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([fdo#109309])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@universal-plane-pipe-c-sanity:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#4070] / [i915#6768])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#4070] / [i915#533] / [i915#6768])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3555]) +1 similar issue
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@kms_vrr@flipline.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          [PASS][204] -> [FAIL][205] ([i915#8724])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-12/igt@perf@enable-disable@0-rcs0.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#2436])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#2434])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@perf@mi-rpc.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][208] ([i915#6806])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#8516])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][210] ([i915#5493])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#2575]) +4 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html

  * igt@v3d/v3d_submit_cl@single-in-sync:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([fdo#109315]) +2 similar issues
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@v3d/v3d_submit_cl@single-in-sync.html

  * igt@v3d/v3d_submit_cl@single-out-sync:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([fdo#109315] / [i915#2575]) +2 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@v3d/v3d_submit_cl@single-out-sync.html

  * igt@v3d/v3d_submit_cl@valid-multisync-submission:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#2575]) +5 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@v3d/v3d_submit_cl@valid-multisync-submission.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#7711]) +5 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@vc4/vc4_mmap@mmap-bo.html
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#7711]) +3 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#7711])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-14/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_perfmon@get-values-valid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#2575])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@vc4/vc4_perfmon@get-values-valid-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#7711]) +2 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][220] ([i915#2410]) -> [PASS][221] +2 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-5/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [FAIL][222] ([i915#6121] / [i915#7052]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg2:          [INCOMPLETE][224] ([i915#7892]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-2/igt@gem_eio@kms.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglu:         [FAIL][226] ([i915#2842]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-tglu-2/igt@gem_exec_fair@basic-flow@rcs0.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][228] ([i915#2842]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [FAIL][230] ([i915#2842]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][232] ([i915#9051]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][234] ([i915#6311]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_hangman@engine-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][236] ([i915#7069]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-1/igt@i915_hangman@engine-engine-hang@vcs0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][238] ([i915#7061] / [i915#8617]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         [WARN][240] ([i915#2681]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [FAIL][242] ([i915#3591]) -> [PASS][243] +1 similar issue
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][244] ([i915#1397]) -> [PASS][245] +1 similar issue
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-1/igt@i915_pm_rpm@dpms-lpsp.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [SKIP][246] ([i915#1397]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [SKIP][248] ([i915#1397]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-16/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [ABORT][250] ([i915#7920] / [i915#7982]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-6/igt@i915_selftest@live@requests.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@i915_selftest@live@requests.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [FAIL][252] ([i915#3743]) -> [PASS][253] +1 similar issue
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][254] ([i915#5138]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-mtlp:         [FAIL][256] ([fdo#103375]) -> [PASS][257] +2 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
    - shard-dg2:          [FAIL][258] ([fdo#103375]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [FAIL][260] ([i915#6880]) -> [PASS][261] +1 similar issue
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-rkl:          [INCOMPLETE][262] -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][264] ([i915#7484]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-mtlp:         [FAIL][266] ([i915#5234]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@perf_pmu@all-busy-idle-check-all.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt1:
    - shard-mtlp:         [SKIP][268] ([i915#8537]) -> [PASS][269] +2 similar issues
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@perf_pmu@render-node-busy-idle@ccs0:
    - shard-mtlp:         [FAIL][270] ([i915#4349]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [FAIL][272] ([i915#8332]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [ABORT][274] ([i915#8521] / [i915#8865]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-snb:          [DMESG-WARN][276] ([i915#8841]) -> [DMESG-FAIL][277] ([fdo#103375])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-snb1/igt@gem_exec_suspend@basic-s0@smem.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb7/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][278] ([i915#5493]) -> [DMESG-WARN][279] ([i915#4936] / [i915#5493])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][280] ([i915#8561]) -> [DMESG-FAIL][281] ([i915#1982] / [i915#8561])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [DMESG-FAIL][282] ([i915#1982] / [i915#2017] / [i915#5954]) -> [DMESG-FAIL][283] ([i915#2017] / [i915#5954])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][284] ([fdo#110189] / [i915#3955]) -> [SKIP][285] ([i915#3955])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][286] ([fdo#109285]) -> [SKIP][287] ([fdo#109285] / [i915#4098])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][288] ([i915#4816]) -> [SKIP][289] ([i915#4070] / [i915#4816])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-dg1:          [SKIP][290] ([i915#1072] / [i915#4078]) -> [SKIP][291] ([i915#1072])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-18/igt@kms_psr@primary_mmap_gtt.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@primary_page_flip:
    - shard-dg1:          [SKIP][292] ([i915#1072]) -> [SKIP][293] ([i915#1072] / [i915#4078])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-15/igt@kms_psr@primary_page_flip.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-16/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
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
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#5978]: https://gitlab.freedesktop.org/drm/intel/issues/5978
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7892]: https://gitlab.freedesktop.org/drm/intel/issues/7892
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8063]: https://gitlab.freedesktop.org/drm/intel/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8503]: https://gitlab.freedesktop.org/drm/intel/issues/8503
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
  [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
  [i915#9051]: https://gitlab.freedesktop.org/drm/intel/issues/9051
  [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
  [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7453 -> IGTPW_9663
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13568: f8b90de70ee92dbdebc6f2078e2edd12756d7a63 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9663: 9663
  IGT_7453: 7453
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/index.html

--===============7861111404701905971==
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
<tr><td><b>Series:</b></td><td>benchmarks/gem_wsim: added basic xe support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122920/">https://patchwork.freedesktop.org/series/122920/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13568_full -&gt; IGTPW_9663_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13568_full and IGTPW_9663_full:</p>
<h3>New IGT tests (35)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-3-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-3-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-3-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9663_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm_test:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb5/igt@drm_mm@drm_mm_test.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@drm_mm@drm_mm_test.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +5 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_caching@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-10ms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@gem_eio@in-flight-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8503">i915#8503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-8/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-glk3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_exec_fair@basic-pace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@gem_exec_fence@concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_exec_schedule@noreorder-priority@rcs0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@gem_mmap@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-17/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109312">fdo#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-apl4/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8456">i915#8456</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-3/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@i915_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5978">i915#5978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-1/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb1/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +5 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@kms_ccs@pipe-d-bad-aux-stride-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +7 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8063">i915#8063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +40 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +14 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1623">i915#1623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8821">i915#8821</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +249 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-3/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-2/igt@kms_psr@sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@kms_selftest@drm_plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-4/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-12/igt@perf@enable-disable@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8724">i915#8724</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-5/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6806">i915#6806</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-valid-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@single-in-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@v3d/v3d_submit_cl@single-in-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@single-out-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-6/igt@v3d/v3d_submit_cl@single-out-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-multisync-submission:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@v3d/v3d_submit_cl@valid-multisync-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-3/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +5 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-14/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@get-values-valid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-7/igt@vc4/vc4_perfmon@get-values-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-5/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-3/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7052">i915#7052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-2/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7892">i915#7892</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-tglu-2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-9/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9051">i915#9051</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-1/igt@i915_hangman@engine-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8617">i915#8617</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-1/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-16/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-6/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8537">i915#8537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8332">i915#8332</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-snb1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-snb7/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-18/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-19/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13568/shard-dg1-15/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9663/shard-dg1-16/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7453 -&gt; IGTPW_9663</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13568: f8b90de70ee92dbdebc6f2078e2edd12756d7a63 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9663: 9663<br />
  IGT_7453: 7453<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7861111404701905971==--
