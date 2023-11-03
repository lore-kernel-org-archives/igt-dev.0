Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1978364371036431697=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Fri, 03 Nov 2023 08:13:25 -0000
Message-ID: <169899920597.29106.10800125904864893033@emeril.freedesktop.org>
References: <20231102062304.1204625-1-kunal1.joshi@intel.com>
In-Reply-To: <20231102062304.1204625-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYWRkIG5l?=
 =?utf-8?q?w_subtests_for_dark_screen_detection?=
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

--===============1978364371036431697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add new subtests for dark screen detection
URL   : https://patchwork.freedesktop.org/series/125880/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13827_full -> IGTPW_10099_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10099_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10099_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10099_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * {igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-1} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][3] +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-1.html

  * {igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-edp-1} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][4] +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-edp-1.html

  * {igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-2} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-2.html

  * {igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-4} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][6] +7 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-14/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-4.html

  * {igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-3} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][7] +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-3.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13827_full and IGTPW_10099_full:

### New IGT tests (45) ###

  * igt@gem_fenced_exec_thrash:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10099_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8411]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#9318])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@debugfs_test@basic-hwmon.html

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-mtlp:         NOTRUN -> [ABORT][13] ([i915#9414])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@debugfs_test@read_all_entries_display_off.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#7701]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#7701])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8414])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@drm_read@short-buffer-block:
    - shard-rkl:          [PASS][18] -> [SKIP][19] ([i915#4098]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@drm_read@short-buffer-block.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@drm_read@short-buffer-block.html

  * igt@fbdev@pan:
    - shard-rkl:          [PASS][20] -> [SKIP][21] ([i915#2582]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@fbdev@pan.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@fbdev@pan.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#3555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][23] ([i915#7297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([fdo#109314])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-rkl:          NOTRUN -> [SKIP][27] ([fdo#109314])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_ctx_persistence@hang.html
    - shard-rkl:          [PASS][29] -> [SKIP][30] ([i915#6252])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-2/igt@gem_ctx_persistence@hang.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][34] -> [ABORT][35] ([i915#7975] / [i915#8213] / [i915#8398])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-7/igt@gem_eio@hibernate.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4812]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4525])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg1:          NOTRUN -> [FAIL][38] ([i915#9606])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-14/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][39] ([i915#2842]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([fdo#109283])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3281]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +13 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3281]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-rkl:          [PASS][47] -> [SKIP][48] ([i915#3281]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-rkl:          NOTRUN -> [ABORT][52] ([i915#7975] / [i915#8213])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4860]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-x.html

  * {igt@gem_fenced_exec_thrash} (NEW):
    - shard-tglu:         NOTRUN -> [INCOMPLETE][55] ([i915#2295])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-3/igt@gem_fenced_exec_thrash.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4613]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl3/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4613]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4083]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@basic-read-write-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4077]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_mmap_gtt@basic-read-write-distinct.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4077]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4077]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4083]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +13 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4270])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4270]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-18/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-6/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4270]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4270]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8428]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4079]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [PASS][74] -> [SKIP][75] ([i915#3282]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-5/igt@gem_userptr_blits@coherency-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3297]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4880]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([fdo#109289]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([fdo#109289]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([fdo#109289]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-1/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [PASS][83] -> [SKIP][84] ([i915#2527]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [PASS][85] -> [INCOMPLETE][86] ([i915#5566])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl2/igt@gen9_exec_parse@allowed-single.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#2856]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#2856]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gen9_exec_parse@secure-batches.html
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#2527]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4881])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@i915_fb_tiling.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-rkl:          [PASS][92] -> [SKIP][93] ([i915#9588])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@i915_hangman@gt-engine-error@bcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#6227])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@i915_module_load@load.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#6412])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#8399])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple@gt0:
    - shard-mtlp:         [PASS][97] -> [ABORT][98] ([i915#9414])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-7/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([fdo#109293] / [fdo#109506])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([fdo#109293] / [fdo#109506])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#8431])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#6621])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#8925]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#8925])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds-idle@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3555] / [i915#8925])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle@gt1.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#6245])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([fdo#109303])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4212])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4215])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-18/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4212])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4212] / [i915#5608])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#6228])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6229])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#9531])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#1769] / [i915#3555])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#1769] / [i915#3555])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#1845] / [i915#4098]) +11 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([fdo#111614]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#5286]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([fdo#111615] / [i915#5286])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][121] -> [FAIL][122] ([i915#5138])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5286]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3638]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([fdo#111614] / [i915#3638]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#111614]) +10 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([fdo#111615]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#5190]) +20 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-tglu:         [PASS][129] -> [FAIL][130] ([i915#3743]) +4 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([fdo#110723]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5190]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([fdo#111615])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#2705]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3742])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4087] / [i915#7213]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4087]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#7828]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([fdo#111827])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([fdo#111827]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_chamelium_color@ctm-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([fdo#111827]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#7828]) +11 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7828]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#7828]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#7828])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7118])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#7118])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3299])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@type1:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3555] / [i915#6944])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3359])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3359]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#3359])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3555]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3555] / [i915#8814])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3359])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([fdo#109274] / [i915#5354]) +7 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4103] / [i915#4213] / [i915#5608])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4103] / [i915#4213])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [PASS][160] -> [SKIP][161] ([i915#1845] / [i915#4098]) +10 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([fdo#109274])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3546]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4103] / [i915#4213]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#9226] / [i915#9261]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#9227])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#9227])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#9227])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#9226] / [i915#9261]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#9226] / [i915#9261]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3804])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#1257])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3555] / [i915#3840]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3555] / [i915#3840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#3469])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([fdo#109274] / [i915#3637] / [i915#3966])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([fdo#109274]) +11 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([fdo#111825]) +8 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([fdo#109274] / [fdo#111767]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([fdo#109274] / [i915#3637])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3637]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#8381])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-panning:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3637] / [i915#4098]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#2672]) +6 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#2587] / [i915#2672])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#2672]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3555]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#2672] / [i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#8708]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#5354]) +43 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#8708]) +27 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([fdo#111825]) +15 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#1825]) +18 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#1849] / [i915#4098]) +11 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#8708]) +9 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [PASS][198] -> [FAIL][199] ([i915#6880]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [PASS][200] -> [SKIP][201] ([i915#1849] / [i915#4098]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([fdo#109280]) +8 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([fdo#111825] / [i915#1825]) +24 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#5439])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#5460])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3023]) +16 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3458]) +25 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#3458]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8228]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_hdr@static-swap.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#8228]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_hdr@static-swap.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#6301])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([fdo#109289])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * {igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-1} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][214] ([fdo#109271]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk4/igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3555]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8821])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8806])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3555]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8806])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [FAIL][220] ([i915#8292])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][221] ([i915#8292])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#5176] / [i915#9423]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#5176] / [i915#9423]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#5235]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#5235]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#6953] / [i915#8152])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#3555] / [i915#5235]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3555] / [i915#4098] / [i915#8152]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#5235]) +11 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#4098] / [i915#6953] / [i915#8152])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#5235]) +19 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#6524])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#6524])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#6524])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_prime@d3hot.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-rkl:          [PASS][236] -> [SKIP][237] ([i915#1849])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#658])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([fdo#111068] / [i915#658]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([fdo#111068] / [i915#658])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][241] ([fdo#109271] / [i915#658]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#4348])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#658]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@cursor_plane_move:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#1072] / [i915#4078]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#1072]) +7 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([fdo#110189]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#1072]) +15 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#5461] / [i915#658])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5461] / [i915#658])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#4235]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([fdo#111615] / [i915#5289])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#4235])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8809])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#4098])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][255] ([IGT#2])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#8623])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][257] ([fdo#109271]) +29 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-snb5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@universal-plane-sanity:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#4098]) +18 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_universal_plane@universal-plane-sanity.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][259] ([i915#8841]) +3 other tests dmesg-warn
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-snb1/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#2437])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#2437]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html
    - shard-apl:          NOTRUN -> [SKIP][262] ([fdo#109271] / [i915#2437])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#2437])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [PASS][264] -> [SKIP][265] ([i915#2436])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [PASS][266] -> [SKIP][267] ([i915#2434])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@perf@mi-rpc.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [PASS][268] -> [FAIL][269] ([i915#4349])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8807])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][271] ([i915#5793])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#8516])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([fdo#109291])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@prime_udl.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([fdo#109291])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#3708])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#3291] / [i915#3708])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3708] / [i915#4077]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][278] ([fdo#109295] / [fdo#111656] / [i915#3708])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@prime_vgem@coherency-gtt.html

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted:
    - shard-apl:          NOTRUN -> [FAIL][279] ([i915#9583])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl6/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:
    - shard-dg2:          NOTRUN -> [FAIL][280] ([i915#9583]) +2 other tests fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html
    - shard-rkl:          NOTRUN -> [FAIL][281] ([i915#9583])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:
    - shard-mtlp:         NOTRUN -> [FAIL][282] ([i915#9583])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html

  * igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted:
    - shard-mtlp:         NOTRUN -> [FAIL][283] ([i915#9582])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html

  * igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:
    - shard-dg2:          NOTRUN -> [FAIL][284] ([i915#9582]) +1 other test fail
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html
    - shard-tglu:         NOTRUN -> [FAIL][285] ([i915#9582])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-3/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([fdo#109315]) +8 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_get_param@get-bad-param:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#2575]) +5 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-1/igt@v3d/v3d_get_param@get-bad-param.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#2575]) +20 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#2575]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html

  * igt@v3d/v3d_perfmon@destroy-valid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([fdo#109315] / [i915#2575]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-2/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html

  * igt@v3d/v3d_wait_bo@unused-bo-1ns:
    - shard-apl:          NOTRUN -> [SKIP][291] ([fdo#109271]) +95 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl7/igt@v3d/v3d_wait_bo@unused-bo-1ns.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#7711]) +11 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-5/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#7711]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#7711]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@vc4/vc4_purgeable_bo@mark-purgeable.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#7711]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_wait_bo@used-bo:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#2575]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-10/igt@vc4/vc4_wait_bo@used-bo.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-rkl:          [SKIP][297] ([i915#2582]) -> [PASS][298] +2 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@fbdev@eof.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@fbdev@eof.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][299] ([i915#7297]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * {igt@gem_compute@compute-square}:
    - shard-rkl:          [SKIP][301] ([i915#9310]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_compute@compute-square.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@gem_compute@compute-square.html

  * igt@gem_eio@banned:
    - shard-mtlp:         [ABORT][303] ([i915#9262]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@gem_eio@banned.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@gem_eio@banned.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][305] ([i915#5784]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-13/igt@gem_eio@reset-stress.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][307] ([i915#2846]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][309] ([i915#2846]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][311] ([i915#2842]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][313] ([i915#3281]) -> [PASS][314] +5 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          [SKIP][315] ([i915#3282]) -> [PASS][316] +1 other test pass
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@gem_pwrite_snooped.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_pwrite_snooped.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          [SKIP][317] ([i915#8411]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][319] ([i915#8489] / [i915#8668]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-dg1:          [FAIL][321] ([i915#3591]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][323] ([i915#7790]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-snb4/igt@i915_pm_rps@reset.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-snb6/igt@i915_pm_rps@reset.html

  * {igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          [SKIP][325] ([i915#4098]) -> [PASS][326] +8 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-WARN][327] ([i915#2017]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-edp-1.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][329] ([i915#2346]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [FAIL][331] ([i915#2346]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:
    - shard-apl:          [INCOMPLETE][333] -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl4/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl4/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-tglu:         [INCOMPLETE][335] -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][337] ([i915#1849] / [i915#4098]) -> [PASS][338] +13 other tests pass
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [INCOMPLETE][339] ([i915#180] / [i915#9392]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * {igt@kms_pm_dc@dc5-dpms-negative}:
    - shard-rkl:          [SKIP][341] ([i915#9293]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * {igt@kms_pm_rpm@i2c}:
    - shard-dg2:          [FAIL][343] ([i915#8717]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_pm_rpm@i2c.html

  * {igt@kms_pm_rpm@modeset-lpsp}:
    - shard-dg1:          [SKIP][345] ([i915#9519]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html

  * {igt@kms_pm_rpm@modeset-non-lpsp-stress}:
    - shard-rkl:          [SKIP][347] ([i915#9519]) -> [PASS][348] +2 other tests pass
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * {igt@kms_pm_rpm@pm-tiling}:
    - shard-rkl:          [SKIP][349] ([fdo#109308]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [SKIP][351] ([i915#1845] / [i915#4098]) -> [PASS][352] +22 other tests pass
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_rotation_crc@primary-rotation-90.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_rotation_crc@primary-rotation-90.html

  * {igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-4}:
    - shard-dg1:          [FAIL][353] ([i915#9196]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-4.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-4.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [FAIL][355] ([i915#4349]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][357] ([i915#4349]) -> [PASS][358] +3 other tests pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][359] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][360] +1 other test pass
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@prime_vgem@basic-write.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          [INCOMPLETE][361] ([i915#9408]) -> [ABORT][362] ([i915#9618])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][363] ([i915#7957]) -> [SKIP][364] ([i915#3555])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [SKIP][365] ([i915#9591]) -> [FAIL][366] ([i915#2842])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-tglu:         [FAIL][367] ([i915#2681] / [i915#3591]) -> [WARN][368] ([i915#2681])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-4:
    - shard-dg1:          [FAIL][369] ([i915#8247]) -> [DMESG-FAIL][370] ([i915#8561]) +2 other tests dmesg-fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-16/igt@kms_async_flips@crc@pipe-c-hdmi-a-4.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_async_flips@crc@pipe-c-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][371] ([i915#1845] / [i915#4098]) -> [SKIP][372] ([i915#1769] / [i915#3555])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][373] ([i915#4098]) -> [SKIP][374] ([i915#5286]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][375] ([i915#5286]) -> [SKIP][376] ([i915#4098]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][377] ([fdo#111614] / [i915#3638]) -> [SKIP][378] ([i915#1845] / [i915#4098])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][379] ([i915#1845] / [i915#4098]) -> [SKIP][380] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][381] ([fdo#110723]) -> [SKIP][382] ([i915#1845] / [i915#4098]) +4 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][383] ([i915#1845] / [i915#4098]) -> [SKIP][384] ([fdo#110723]) +6 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          [SKIP][385] ([i915#1845] / [i915#4098]) -> [SKIP][386] ([i915#7118])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_content_protection@atomic.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][387] ([i915#3116]) -> [SKIP][388] ([i915#1845] / [i915#4098])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][389] ([i915#1845] / [i915#4098]) -> [SKIP][390] ([i915#3116])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][391] ([i915#7118] / [i915#7162]) -> [SKIP][392] ([i915#7118])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-11/igt@kms_content_protection@type1.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_content_protection@type1.html
    - shard-rkl:          [SKIP][393] ([i915#7118]) -> [SKIP][394] ([i915#1845] / [i915#4098])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@kms_content_protection@type1.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][395] ([i915#4098]) -> [SKIP][396] ([fdo#109279] / [i915#3359])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][397] ([i915#3359]) -> [SKIP][398] ([i915#4098]) +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          [SKIP][399] ([i915#4098]) -> [SKIP][400] ([i915#3555]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][401] ([i915#4103]) -> [SKIP][402] ([i915#1845] / [i915#4098]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][403] ([i915#1845] / [i915#4098]) -> [SKIP][404] ([fdo#111825]) +6 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-rkl:          [SKIP][405] ([fdo#111825]) -> [SKIP][406] ([i915#1845] / [i915#4098]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][407] ([i915#4098]) -> [SKIP][408] ([i915#3555] / [i915#3840])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][409] ([i915#3555] / [i915#3840]) -> [SKIP][410] ([i915#4098]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][411] ([fdo#110189] / [i915#3955]) -> [SKIP][412] ([i915#3955])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][413] ([fdo#109285]) -> [SKIP][414] ([fdo#109285] / [i915#4098])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][415] ([i915#1849] / [i915#4098]) -> [SKIP][416] ([i915#3023]) +18 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][417] ([i915#1849] / [i915#4098]) -> [SKIP][418] ([fdo#111825] / [i915#1825]) +36 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html

--===============1978364371036431697==
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
<tr><td><b>Series:</b></td><td>add new subtests for dark screen detection</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125880/">https://patchwork.freedesktop.org/series/125880/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13827_full -&gt; IGTPW_10099_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10099_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10099_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/index.html</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10099_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-6/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-1} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-1.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-edp-1} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-edp-1.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-2} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-2.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-4} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-14/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-4.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-3} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-3.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-2.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13827_full and IGTPW_10099_full:</p>
<h3>New IGT tests (45)</h3>
<ul>
<li>
<p>igt@gem_fenced_exec_thrash:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@negative-darkscreen-read-crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10099_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries_display_off:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@debugfs_test@read_all_entries_display_off.html">ABORT</a> ([i915#9414])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#8414]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@drm_read@short-buffer-block.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@drm_read@short-buffer-block.html">SKIP</a> ([i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@fbdev@pan.html">SKIP</a> ([i915#2582]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-2/igt@gem_ctx_persistence@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#6252])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-7/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213] / [i915#8398])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-14/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> ([i915#3281]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@gem_exec_reloc@basic-write-cpu-noreloc.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@gem_fenced_exec_thrash} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-3/igt@gem_fenced_exec_thrash.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl3/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@gem_mmap@bad-object.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read-write-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_mmap_gtt@basic-read-write-distinct.html">SKIP</a> ([i915#4077]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@gem_mmap_gtt@basic-short.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_mmap_wc@close.html">SKIP</a> ([i915#4083]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-18/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-6/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#3282]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-1/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2527]) +2 other tests skip</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl4/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> ([i915#5566])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856]) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> ([i915#9588])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-7/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html">ABORT</a> ([i915#9414])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-6/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> ([i915#8431])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle@gt1.html">SKIP</a> ([i915#3555] / [i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-18/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-5/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_async_flips@test-cursor.html">SKIP</a> ([i915#6229])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> ([i915#1845] / [i915#4098]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) +20 other tests skip</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) +4 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> ([fdo#111827]) +5 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> ([fdo#111827]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +5 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [i915#5354]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([i915#3546]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html">SKIP</a> ([i915#9227])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html">SKIP</a> ([i915#9227])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [i915#3637] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#109274]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> ([fdo#111825]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_flip@flip-vs-panning.html">SKIP</a> ([i915#3637] / [i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#3555]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> ([fdo#111825]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +11 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +9 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> ([i915#6880]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109280]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825] / [i915#1825]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#3023]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> ([i915#3458]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-1} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk4/igt@kms_pipe_crc_basic@darkscreen-read-crc@pipe-c-hdmi-a-1.html">SKIP</a> ([fdo#109271]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-8/igt@kms_plane_lowres@tiling-4.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +1 other test skip</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1.html">SKIP</a> ([i915#3555] / [i915#5235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> ([i915#5235]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068] / [i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#658]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@kms_psr@cursor_plane_move.html">SKIP</a> ([i915#1072] / [i915#4078]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([i915#1072]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-3/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#110189]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([i915#1072]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> ([i915#4235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-snb5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109271]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_universal_plane@universal-plane-sanity.html">SKIP</a> ([i915#4098]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-snb1/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1.html">DMESG-WARN</a> ([i915#8841]) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) +2 other tests skip</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([i915#3555] / [i915#8807])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@prime_udl.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109295] / [fdo#111656] / [i915#3708])</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl6/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html">FAIL</a> ([i915#9583]) +2 other tests fail</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html">FAIL</a> ([i915#9583])</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html">FAIL</a> ([i915#9583])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-3/igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted.html">FAIL</a> ([i915#9582])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html">FAIL</a> ([i915#9582]) +1 other test fail</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-3/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html">FAIL</a> ([i915#9582])</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> ([fdo#109315]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-1/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-11/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> ([i915#2575]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-invalid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-16/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-2/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html">SKIP</a> ([fdo#109315] / [i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-1ns:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl7/igt@v3d/v3d_wait_bo@unused-bo-1ns.html">SKIP</a> ([fdo#109271]) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-5/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-4/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a> ([i915#7711]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@vc4/vc4_purgeable_bo@mark-purgeable.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-10/igt@vc4/vc4_wait_bo@used-bo.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@fbdev@eof.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-1/igt@fbdev@eof.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_compute@compute-square}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@gem_compute@compute-square.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@banned:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@gem_eio@banned.html">ABORT</a> ([i915#9262]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@gem_eio@banned.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-13/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk6/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@gem_pwrite_snooped.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_pwrite_snooped.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-snb4/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-snb6/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-edp-1.html">DMESG-WARN</a> ([i915#2017]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl4/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl4/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">INCOMPLETE</a> ([i915#180] / [i915#9392]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc5-dpms-negative}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> ([i915#9293]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@i2c}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-2/igt@kms_pm_rpm@i2c.html">FAIL</a> ([i915#8717]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-1/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-lpsp}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp-stress}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@pm-tiling}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109308]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-4}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@prime_vgem@basic-write.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#9408]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#9618])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">SKIP</a> ([i915#9591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> ([i915#2681] / [i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg1-16/igt@kms_async_flips@crc@pipe-c-hdmi-a-4.html">FAIL</a> ([i915#8247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg1-17/igt@kms_async_flips@crc@pipe-c-hdmi-a-4.html">DMESG-FAIL</a> ([i915#8561]) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#110723]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-4/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#1845] / [i915#4098])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([fdo#111825]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([fdo#110189] / [i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3023]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13827/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10099/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap</p>
</li>
</ul>

</body>
</html>

--===============1978364371036431697==--
