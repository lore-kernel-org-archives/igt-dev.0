Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 May 2021 21:45:58 -0000
Message-ID: <162137435882.23336.11634878292494932444@emeril.freedesktop.org>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Flease=3A_Add_subtest_description_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0111557409=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0111557409==
Content-Type: multipart/alternative;
 boundary="===============0625006418512902100=="

--===============0625006418512902100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_lease: Add subtest description (rev6)
URL   : https://patchwork.freedesktop.org/series/89869/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6087_full -> IGTPW_5819_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5819_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5819_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5819_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-glk:          NOTRUN -> [TIMEOUT][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-glk:          [PASS][2] -> [TIMEOUT][3] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b:
    - shard-glk:          [PASS][4] -> [FAIL][5] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-glk:          [FAIL][6] ([i915#3457]) -> [TIMEOUT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@gem_ctx_persistence@heartbeat-close.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][8] ([i915#3457]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d:
    - shard-glk:          [SKIP][10] ([fdo#109271]) -> [TIMEOUT][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes}:
    - shard-glk:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  
Known issues
------------

  Here are the changes found in IGTPW_5819_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@execbuf-with-allocator:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][14] ([i915#3457]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@api_intel_allocator@execbuf-with-allocator.html

  * igt@api_intel_bb@blit-noreloc-keep-cache-random:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][15] ([i915#3457]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@api_intel_bb@blit-noreloc-keep-cache-random.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-snb:          NOTRUN -> [DMESG-WARN][16] ([i915#3457])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb5/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@delta-check:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][17] ([i915#3457]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk6/igt@api_intel_bb@delta-check.html

  * igt@api_intel_bb@intel-bb-blit-x:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#3471])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@api_intel_bb@intel-bb-blit-x.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk8/igt@api_intel_bb@intel-bb-blit-x.html

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#111827])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb6/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#111827])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#1839]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#1839]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][24] ([i915#3002])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][25] ([i915#3002])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl2/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][26] ([i915#3002])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][27] ([i915#3002])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_create@create-massive.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-apl:          NOTRUN -> [INCOMPLETE][28] ([i915#3457] / [i915#3468]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#1099]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_shared@q-in-order:
    - shard-snb:          NOTRUN -> [SKIP][30] ([fdo#109271]) +402 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb2/igt@gem_ctx_shared@q-in-order.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][31] -> [TIMEOUT][32] ([i915#2369] / [i915#3063] / [i915#3457])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][33] ([i915#3457])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][34] ([i915#2842] / [i915#3457]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][35] ([i915#2842] / [i915#3457])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][36] -> [FAIL][37] ([i915#2842] / [i915#3457])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][38] ([i915#2842] / [i915#3457]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          NOTRUN -> [FAIL][39] ([i915#2842] / [i915#3457]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][40] ([i915#3457])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#2842] / [i915#3457]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][43] ([i915#2389] / [i915#3457]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][44] ([i915#3457]) +39 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          NOTRUN -> [DMESG-WARN][45] ([i915#118] / [i915#95]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][46] ([i915#3468]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][47] ([i915#3468])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][48] ([i915#3468] / [i915#750])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][49] ([i915#3468]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][50] ([i915#3468]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][51] ([i915#2658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][52] ([i915#2658])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb7/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][53] ([i915#2658])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl6/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +212 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#768]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109312]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109312]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_spin_batch@legacy@bsd1:
    - shard-apl:          NOTRUN -> [FAIL][58] ([i915#3457]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@gem_spin_batch@legacy@bsd1.html

  * igt@gem_spin_batch@legacy@default:
    - shard-apl:          NOTRUN -> [FAIL][59] ([i915#2898] / [i915#3457]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@gem_spin_batch@legacy@default.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-kbl:          NOTRUN -> [FAIL][60] ([i915#3324])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@gem_userptr_blits@set-cache-level.html
    - shard-snb:          NOTRUN -> [FAIL][61] ([i915#3324])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb2/igt@gem_userptr_blits@set-cache-level.html
    - shard-tglb:         NOTRUN -> [FAIL][62] ([i915#3324])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@gem_userptr_blits@set-cache-level.html
    - shard-apl:          NOTRUN -> [FAIL][63] ([i915#3324])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@gem_userptr_blits@set-cache-level.html
    - shard-iclb:         NOTRUN -> [FAIL][64] ([i915#3324])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@gem_userptr_blits@set-cache-level.html
    - shard-glk:          NOTRUN -> [FAIL][65] ([i915#3324])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#3297]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3297]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109289]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109289]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#112306]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#112306]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_hangman@engine-error@rcs0:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +153 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@i915_hangman@engine-error@rcs0.html

  * igt@i915_hangman@engine-hang@rcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][73] ([i915#3457]) +11 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl4/igt@i915_hangman@engine-hang@rcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][74] ([i915#454])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3288])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][76] ([i915#3343])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#110892]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][79] ([i915#3462])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@mman:
    - shard-apl:          NOTRUN -> [DMESG-WARN][80] ([i915#3457]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@i915_selftest@live@mman.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111614]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#111615]) +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk8/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271] / [fdo#111827]) +29 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb7/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_color@pipe-c-degamma:
    - shard-glk:          [PASS][87] -> [FAIL][88] ([i915#71]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk3/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109278] / [i915#1149]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color@pipe-d-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][90] ([i915#1149])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@kms_color@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109284] / [fdo#111827]) +14 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          NOTRUN -> [FAIL][95] ([i915#3457]) +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3319] / [i915#3457]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][97] ([i915#3444] / [i915#3457]) +16 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#3457]) +37 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109278] / [fdo#109279] / [i915#3457]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-iclb:         NOTRUN -> [FAIL][100] ([i915#3457]) +13 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-glk:          NOTRUN -> [FAIL][101] ([i915#3444] / [i915#3457]) +11 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          NOTRUN -> [FAIL][102] ([i915#3444] / [i915#3457]) +9 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-kbl:          [PASS][103] -> [FAIL][104] ([i915#3444] / [i915#3457])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-iclb:         [PASS][105] -> [FAIL][106] ([i915#3457]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen:
    - shard-apl:          [PASS][107] -> [FAIL][108] ([i915#3444] / [i915#3457])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#3359] / [i915#3457]) +6 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][110] -> [FAIL][111] ([i915#3444] / [i915#3457]) +4 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-tglb:         NOTRUN -> [FAIL][112] ([i915#2124] / [i915#3457]) +12 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:
    - shard-glk:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#3457]) +22 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109278] / [i915#3457]) +17 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109279] / [i915#3359] / [i915#3457]) +9 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
    - shard-snb:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#3457]) +63 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#3457]) +26 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge:
    - shard-glk:          NOTRUN -> [FAIL][118] ([i915#70])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#109278]) +19 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109274] / [fdo#109278]) +8 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([fdo#111825]) +62 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#533])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#533]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109274]) +5 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][125] ([i915#180]) +4 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#2672])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2672])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:
    - shard-glk:          [PASS][128] -> [FAIL][129] ([i915#699])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-c:
    - shard-glk:          [PASS][130] -> [FAIL][131] ([i915#3484])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html

--===============0625006418512902100==
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
<tr><td><b>Series:</b></td><td>tests/kms_lease: Add subtest description (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89869/">https://patchwork.freedesktop.org/series/89869/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6087_full -&gt; IGTPW_5819_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5819_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5819_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5819_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_addfb_basic@bad-pitch-999.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@gem_ctx_persistence@heartbeat-close.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@gem_ctx_persistence@heartbeat-close.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes}:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5819_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@api_intel_allocator@execbuf-with-allocator.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@api_intel_bb@blit-noreloc-keep-cache-random.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb5/igt@api_intel_bb@blit-reloc-keep-cache.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk6/igt@api_intel_bb@delta-check.html">DMESG-FAIL</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@api_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk8/igt@api_intel_bb@intel-bb-blit-x.html">FAIL</a> ([i915#3471])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb6/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@gem_ctx_engines@invalid-engines.html">INCOMPLETE</a> ([i915#3457] / [i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb2/igt@gem_ctx_shared@q-in-order.html">SKIP</a> ([fdo#109271]) +402 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@gem_exec_balancer@bonded-dual.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.html">FAIL</a> ([i915#3457]) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468] / [i915#750])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +212 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@bsd1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@gem_spin_batch@legacy@bsd1.html">FAIL</a> ([i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@default:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@gem_spin_batch@legacy@default.html">FAIL</a> ([i915#2898] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb2/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@i915_hangman@engine-error@rcs0.html">SKIP</a> ([fdo#109271]) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl4/igt@i915_hangman@engine-hang@rcs0.html">DMESG-WARN</a> ([i915#3457]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@i915_selftest@live@mman.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk8/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb7/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk3/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@kms_color@pipe-d-degamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL</a> ([i915#3444] / [i915#3457]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([fdo#109271] / [i915#3457]) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3457]) +13 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3444] / [i915#3457]) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">FAIL</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html">FAIL</a> ([i915#3444] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html">SKIP</a> ([i915#3359] / [i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL</a> ([i915#2124] / [i915#3457]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html">SKIP</a> ([fdo#109271] / [i915#3457]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278] / [i915#3457]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359] / [i915#3457]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html">SKIP</a> ([fdo#109271] / [i915#3457]) +63 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html">SKIP</a> ([fdo#109271] / [i915#3457]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html">FAIL</a> ([i915#70])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">SKIP</a> ([fdo#109278]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +62 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-iclb4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> ([fdo#109274]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/shard-glk5/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html">FAIL</a> ([i915#699])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-c:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2">PASS</a> -&gt; [FAIL][131] ([i915#3484])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0625006418512902100==--

--===============0111557409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0111557409==--
