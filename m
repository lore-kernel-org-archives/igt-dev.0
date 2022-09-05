Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3425374476066106061=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 05 Sep 2022 17:45:57 -0000
Message-ID: <166239995739.1948.11153456556314275044@emeril.freedesktop.org>
References: <20220905112455.719-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220905112455.719-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup_=28rev10=29?=
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

--===============3425374476066106061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Test Cleanup (rev10)
URL   : https://patchwork.freedesktop.org/series/106898/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12072_full -> IGTPW_7737_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/index.html

Participating hosts (12 -> 9)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7737_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_multiple@tiling-4}:
    - {shard-tglu}:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglu-5/igt@kms_plane_multiple@tiling-4.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12072_full and IGTPW_7737_full:

### New IGT tests (57) ###

  * igt@kms_draw_crc@draw-method:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_draw_crc@draw-method@rgb565-blt-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@rgb565-blt-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@rgb565-blt-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-cpu-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.14, 0.27] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-cpu-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-cpu-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-gtt-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-gtt-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.14] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-gtt-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.15] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-wc-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-wc-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@rgb565-mmap-wc-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@kms_draw_crc@draw-method@rgb565-pwrite-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.45] s

  * igt@kms_draw_crc@draw-method@rgb565-pwrite-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.11, 1.25] s

  * igt@kms_draw_crc@draw-method@rgb565-pwrite-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.88] s

  * igt@kms_draw_crc@draw-method@rgb565-render-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_draw_crc@draw-method@rgb565-render-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_draw_crc@draw-method@rgb565-render-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-blt-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-blt-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-blt-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.19] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-cpu-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.13, 0.28] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-cpu-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-cpu-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-gtt-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-gtt-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-gtt-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-wc-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-wc-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-mmap-wc-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-pwrite-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.61] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-pwrite-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 2.07] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-pwrite-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 2.25] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-render-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.23] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-render-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.23] s

  * igt@kms_draw_crc@draw-method@xrgb2101010-render-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@kms_draw_crc@draw-method@xrgb8888-blt-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb8888-blt-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb8888-blt-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-cpu-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.18, 1.09] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-cpu-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-cpu-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-gtt-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-gtt-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-gtt-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-wc-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-wc-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb8888-mmap-wc-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.20] s

  * igt@kms_draw_crc@draw-method@xrgb8888-pwrite-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.62] s

  * igt@kms_draw_crc@draw-method@xrgb8888-pwrite-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.11, 2.07] s

  * igt@kms_draw_crc@draw-method@xrgb8888-pwrite-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.12, 2.27] s

  * igt@kms_draw_crc@draw-method@xrgb8888-render-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.24] s

  * igt@kms_draw_crc@draw-method@xrgb8888-render-xtiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.23] s

  * igt@kms_draw_crc@draw-method@xrgb8888-render-ytiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.23] s

  * igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_plane_multiple@tiling-x@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  

Known issues
------------

  Here are the changes found in IGTPW_7737_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_mm@all:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#6433])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@drm_mm@all.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         NOTRUN -> [FAIL][3] ([i915#2410])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-snb2/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#280])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#5784])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglb3/igt@gem_eio@reset-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][10] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl7/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl2/igt@gem_lmem_swapping@heavy-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb6/igt@gem_lmem_swapping@heavy-multi.html
    - shard-glk:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk5/igt@gem_lmem_swapping@heavy-multi.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4613]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb4/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#284])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#111656])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb1/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109292])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb3/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4270]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4270])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb7/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#768])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb6/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#3297]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb1/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#3297]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb7/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109290])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb7/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#110542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109289]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@gen7_exec_parse@chained-batch.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb8/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#2527] / [i915#2856])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#454])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109303])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109303])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#1769])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#5286])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#5286])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111614])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-glk:          [PASS][43] -> [DMESG-FAIL][44] ([i915#118] / [i915#1888])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-glk9/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271]) +45 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111615] / [i915#3689]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689] / [i915#6095]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#3886]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb8/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278]) +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#6095]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3742])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk7/igt@kms_chamelium@dp-hpd-for-each-pipe.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb5/igt@kms_chamelium@dp-hpd-for-each-pipe.html
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-snb4/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl2/igt@kms_chamelium@hdmi-crc-single.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_content_protection@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#1063])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3116] / [i915#3299])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3116])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#426])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#426])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#2672]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#3555])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#2672]) +11 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([i915#3555])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109280] / [fdo#111825]) +20 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +121 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#6497]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109280]) +14 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2920])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#2920]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [PASS][85] -> [SKIP][86] ([i915#5519]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-iclb:         [PASS][87] -> [SKIP][88] ([i915#5519])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][89] ([fdo#109271]) +90 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-snb6/igt@kms_tv_load_detect@load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109309])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109309])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#533])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#533])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2437])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl8/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2530]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb6/igt@nouveau_crc@pipe-c-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2530])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109291]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@prime_nv_pcopy@test1_macro.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109291]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2994]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl6/igt@sysfs_clients@fair-1.html
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2994]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@sysfs_clients@fair-1.html
    - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2994])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk1/igt@sysfs_clients@fair-1.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#2994])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb5/igt@sysfs_clients@fair-1.html

  
#### Possible fixes ####

  * igt@drm_read@empty-block:
    - {shard-rkl}:        [SKIP][103] ([i915#1845] / [i915#4098]) -> [PASS][104] +6 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-2/igt@drm_read@empty-block.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@drm_read@empty-block.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][105] ([i915#6268]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][107] ([i915#4525]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][111] ([i915#2842]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [FAIL][113] ([i915#2842]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - {shard-rkl}:        [SKIP][115] ([i915#3281]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-active.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118] +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@gem_workarounds@suspend-resume.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl4/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][119] ([i915#5566] / [i915#716]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][121] ([i915#6258]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][123] ([i915#454]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-tglu}:       [WARN][125] ([i915#2681]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@i2c:
    - {shard-rkl}:        [SKIP][127] ([fdo#109308]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-5/igt@i915_pm_rpm@i2c.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@i915_pm_rpm@i2c.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         [FAIL][129] ([i915#3743]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][131] ([i915#2346]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - {shard-rkl}:        [SKIP][133] ([i915#1849] / [i915#4098]) -> [PASS][134] +7 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][135] ([i915#433]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [FAIL][137] ([i915#1188]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
    - {shard-rkl}:        [SKIP][139] ([i915#1849] / [i915#3546] / [i915#4070] / [i915#4098]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][141] ([fdo#109441]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - {shard-rkl}:        [SKIP][143] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  * igt@perf@buffer-fill:
    - shard-glk:          [FAIL][145] -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-glk6/igt@perf@buffer-fill.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk8/igt@perf@buffer-fill.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [INCOMPLETE][147] -> [DMESG-FAIL][148] ([i915#1759])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-tglb5/igt@i915_selftest@live@gt_pm.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@i915_selftest@live@gt_pm.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][149] ([i915#2920]) -> [SKIP][150] ([fdo#111068] / [i915#658])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][151] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][152] ([i915#5939])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-iclb5/igt@kms_psr2_su@page_flip-p010.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][159], [FAIL][160]) ([i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl7/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl8/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl8/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl4/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
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
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6644 -> IGTPW_7737
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12072: 1fd020e5f55114c0d9a24f560a157fa61d4f3ee1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7737: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/index.html
  IGT_6644: 9a530abd8643805e586583b6cb1af522ddb43408 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/index.html

--===============3425374476066106061==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Test Cleanup (rev10=
)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106898/">https://patchwork.freedesktop.org/series/106898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7737/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12072_full -&gt; IGTPW_7737_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/index.=
html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7737=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane_multiple@tiling-4}:<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglu-5/igt@kms_plane_multiple@tiling-4.html"=
>SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12072_full and IGTPW_7737_=
full:</p>
<h3>New IGT tests (57)</h3>
<ul>
<li>
<p>igt@kms_draw_crc@draw-method:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-blt-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-blt-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-blt-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-cpu-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.14, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-cpu-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-cpu-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-gtt-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-gtt-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-gtt-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-wc-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-wc-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-mmap-wc-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-pwrite-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-pwrite-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.11, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-pwrite-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-render-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-render-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@rgb565-render-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-blt-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-blt-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-blt-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-cpu-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.13, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-cpu-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-cpu-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-gtt-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-gtt-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-wc-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-wc-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-mmap-wc-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-pwrite-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-pwrite-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.10, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-pwrite-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-render-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-render-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb2101010-render-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-blt-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.08, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-blt-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.08, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-blt-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-cpu-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.18, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-cpu-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-cpu-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-gtt-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-gtt-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-gtt-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-wc-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-wc-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-mmap-wc-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-pwrite-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-pwrite-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.11, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-pwrite-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.12, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-render-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.08, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-render-xtiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.08, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method@xrgb8888-render-ytiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7737_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_mm@all:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@drm_mm@all.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@gem_ctx_persistence@many-contexts.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-snb2/igt@gem_ctx_persistence@process.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglb3/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-tglb3/igt=
@gem_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7737/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525"=
>i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-apl7/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i=
915#2846</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk5/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i=
915#2846</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/s=
hard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/sh=
ard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-apl2/igt@gem_lmem_swapping@heavy-multi.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb6/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613"=
>i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk5/igt@gem_lmem_swapping@heavy-multi.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb4/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613"=
>i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb1/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#1=
11656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb3/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo#1=
09292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb3/igt@gem_pxp@reject-modify-context-prote=
ction-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb7/igt@gem_pxp@reject-modify-context-prote=
ction-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-iclb6/igt@gem_render_copy@linear-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb1/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb7/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb7/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb7/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb7/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb8/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb1/igt@gen9_exec_parse@batch-invalid-leng=
th.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb6/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl8/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb5/igt@i915_query@query-topology-known-pci=
-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109303">fdo#109303</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb2/igt@i915_query@query-topology-known-pci=
-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109303">fdo#109303</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_big_fb@4-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_big_fb@4-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-glk9/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/sha=
rd-glk1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-glk7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-apl8/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb8/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_ccs@pipe-d-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk7/igt@kms_chamelium@dp-hpd-for-each-pipe.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb5/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-snb4/igt@kms_chamelium@dp-hpd-for-each-pipe.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-apl2/igt@kms_chamelium@hdmi-crc-single.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb5/igt@kms_content_protection@atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063=
">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb2/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3299">i915#3299</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb4/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3116">i915#3116</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/426">i915#426</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/426">i915#426</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_flip@2x-flip-vs-modeset.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3637">i915#3637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb6/igt@kms_flip@2x-flip-vs-modeset.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +11 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_flip_sc=
aled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +20 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +121 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard=
-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12072/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7737/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5519">i915#5519</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12072/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7737/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5519">i915#5519</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-snb6/igt@kms_tv_load_detect@load-detect.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) +90 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb3/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb1/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-apl8/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb6/igt@nouveau_crc@pipe-c-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb2/igt@nouveau_crc@pipe-c-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb2/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-apl6/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-tglb5/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-glk1/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7737/shard-iclb5/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@empty-block:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-2/igt@drm_read@empty-block.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/sh=
ard-rkl-6/igt@drm_read@empty-block.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737=
/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7737/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html">P=
ASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7737/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
737/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/s=
hard-glk2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-active.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7737/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-active.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-apl1/igt@gem_workarounds@suspend-resume.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
737/shard-apl4/igt@gem_workarounds@suspend-resume.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-apl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7737/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#=
6258</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
737/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-iclb=
8/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i9=
15#2681</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7737/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-5/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#109308</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/=
igt@i915_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7737/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7737/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb=
-scaledprimary.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/sha=
rd-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-apl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i=
915#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7737/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
49">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b=
-coverage-7efc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_77=
37/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-p=
ipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7737/shard-rkl-6/igt@kms_universal_plane@disabl=
e-primary-vs-flip-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-glk6/igt@perf@buffer-fill.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-glk8/igt@perf=
@buffer-fill.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-tglb5/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard=
-tglb3/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7737/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12072/shard-iclb5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7737/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12072/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12072/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12072/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12072/shard-apl8/igt@runner@aborted.=
html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/6599">i915#6599</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/shard-apl4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7737/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)=
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
<li>IGT: IGT_6644 -&gt; IGTPW_7737</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12072: 1fd020e5f55114c0d9a24f560a157fa61d4f3ee1 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7737: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7737/index.htm=
l<br />
  IGT_6644: 9a530abd8643805e586583b6cb1af522ddb43408 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3425374476066106061==--
