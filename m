Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2055302360397203051=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 25 Oct 2022 08:53:52 -0000
Message-ID: <166668803245.15484.5743214241768667527@emeril.freedesktop.org>
References: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igdm1fYmlu?=
 =?utf-8?q?d=3A_Add_VM=5FBIND_validation_support_=28rev9=29?=
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

--===============2055302360397203051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vm_bind: Add VM_BIND validation support (rev9)
URL   : https://patchwork.freedesktop.org/series/105881/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12289_full -> IGTPW_7999_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7999_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7999_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7999_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec3_balancer@parallel-ordering} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-1/igt@gem_exec3_balancer@parallel-ordering.html

  * {igt@gem_lmem_swapping@vm_bind} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_lmem_swapping@vm_bind.html

  * {igt@gem_lmem_swapping@vm_bind@lmem0} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-dg1-13/igt@gem_lmem_swapping@vm_bind@lmem0.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk7/igt@gem_pread@exhaustion.html

  * {igt@i915_vm_bind_sanity@basic} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@i915_vm_bind_sanity@basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12289_full and IGTPW_7999_full:

### New IGT tests (5) ###

  * igt@gem_exec3_balancer@parallel-ordering:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec3_basic@basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@vm_bind:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_lmem_swapping@vm_bind@lmem0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_sanity@basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7999_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@api_intel_bb@crc32.html
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@api_intel_bb@crc32.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#6335])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#6268])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-snb4/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb2/igt@gem_exec_balancer@parallel.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#6117])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#6334])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#6334])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#6344])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_exec_capture@capture-recoverable.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#6344])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109313])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4613]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb8/igt@gem_lmem_swapping@heavy-multi.html
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4613]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@gem_lmem_swapping@heavy-random.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk7/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#284])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][30] ([i915#7311])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_mmap@big-bo.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-snb6/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][33] ([i915#7311])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271]) +139 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-snb5/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#4270]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#4270])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#768]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][38] ([i915#4171])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@gem_softpin@evict-single-offset.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109312])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_softpin@evict-snoop.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109312])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3297]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#3297]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_render_tiledx_blits:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109289]) +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109289]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#2527] / [i915#2856]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#2856]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][47] ([i915#3989] / [i915#454])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_query@hwconfig_table:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#6245])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@i915_query@hwconfig_table.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#6245])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@i915_query@hwconfig_table.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3826])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#3826])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1:
    - shard-snb:          [PASS][52] -> [FAIL][53] ([i915#2521])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-snb4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-snb7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#404])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#5286]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#5286]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111614]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110723]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#2705])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2705])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3886]) +8 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689] / [i915#3886]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3689] / [i915#6095]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111615] / [i915#3689]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [i915#3886]) +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +6 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk3/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278]) +30 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#6095]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-snb:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-snb2/igt@kms_chamelium@dp-crc-single.html
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl2/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk6/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb8/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][77] ([i915#315] / [i915#6946]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#7118])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][79] ([i915#7121] / [i915#7173])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3116] / [i915#3299])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#7118]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#3555]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109279] / [i915#3359])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109279] / [i915#3359])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3555]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#3359]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#3359]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109274] / [fdo#111825]) +7 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipb@atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [PASS][89] -> [FAIL][90] ([i915#2346]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#3840])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][93] -> [FAIL][94] ([i915#79]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109274]) +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2672]) +5 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#6375])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2587] / [i915#2672]) +5 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#2587] / [i915#2672]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-glk:          [PASS][100] -> [FAIL][101] ([i915#2546]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109280] / [fdo#111825]) +31 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109280]) +30 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#6497]) +12 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271]) +127 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [FAIL][106] ([i915#2546])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271]) +174 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][108] -> [SKIP][109] ([i915#433])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][110] ([i915#4573]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][111] ([i915#4573]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#112054] / [i915#5288]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#3536]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][114] -> [SKIP][115] ([i915#5235]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#6524])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#6524])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#658]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#2920]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#658]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#658]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#111068] / [i915#658])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][123] ([i915#5939]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][124] -> [SKIP][125] ([fdo#109441]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([fdo#109441]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> [FAIL][127] ([i915#132] / [i915#3467]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([fdo#109309])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][129] ([fdo#109309])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [PASS][130] -> [FAIL][131] ([i915#43])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk1/igt@kms_vblank@pipe-b-accuracy-idle.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#2437])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_writeback@writeback-check-output.html
    - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#2437])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl2/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#2437])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#2437])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk5/igt@kms_writeback@writeback-check-output.html

  * igt@prime_vgem@coherency-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][136] ([fdo#109292] / [fdo#109295])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@prime_vgem@coherency-gtt.html
    - shard-tglb:         NOTRUN -> [SKIP][137] ([fdo#109295] / [fdo#111656])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-3:
    - shard-apl:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#2994]) +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl6/igt@sysfs_clients@fair-3.html
    - shard-tglb:         NOTRUN -> [SKIP][139] ([i915#2994]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@sema-10:
    - shard-glk:          NOTRUN -> [SKIP][140] ([fdo#109271] / [i915#2994]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk3/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@split-25:
    - shard-iclb:         NOTRUN -> [SKIP][141] ([i915#2994]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - {shard-rkl}:        [SKIP][142] ([i915#6252]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][144] ([fdo#103375]) -> [PASS][145] +4 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - {shard-dg1}:        [FAIL][146] ([i915#5784]) -> [PASS][147] +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-dg1-18/igt@gem_eio@unwedge-stress.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-dg1-16/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][148] ([i915#2846]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][150] ([i915#2842]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-rkl}:        [FAIL][152] ([i915#2842]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - {shard-rkl}:        [SKIP][154] ([i915#3281]) -> [PASS][155] +14 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][156] ([i915#7276]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-tglb:         [DMESG-WARN][158] ([i915#7311]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb2/igt@gem_mmap_gtt@big-bo-tiledx.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_pread@snoop:
    - {shard-rkl}:        [SKIP][160] ([i915#3282]) -> [PASS][161] +3 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-6/igt@gem_pread@snoop.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/igt@gem_pread@snoop.html

  * igt@gem_softpin@evict-single-offset:
    - shard-tglb:         [FAIL][162] ([i915#4171]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb5/igt@gem_softpin@evict-single-offset.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@gem_softpin@evict-single-offset.html

  * igt@gen9_exec_parse@valid-registers:
    - {shard-rkl}:        [SKIP][164] ([i915#2527]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][166] ([i915#658]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-4/igt@i915_pm_dc@dc5-psr.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@pm-tiling:
    - {shard-rkl}:        [SKIP][168] ([fdo#109308]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-4/igt@i915_pm_rpm@pm-tiling.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_selftest@live@hugepages:
    - shard-tglb:         [DMESG-FAIL][170] ([i915#7311]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb2/igt@i915_selftest@live@hugepages.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@i915_selftest@live@hugepages.html
    - shard-iclb:         [DMESG-FAIL][172] ([i915#7311]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb5/igt@i915_selftest@live@hugepages.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@perf@request:
    - shard-iclb:         [DMESG-WARN][174] ([i915#2867] / [i915#4391]) -> [PASS][175] +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb7/igt@i915_selftest@perf@request.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@i915_selftest@perf@request.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-rkl}:        [SKIP][176] ([i915#1845] / [i915#4098]) -> [PASS][177] +16 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][178] ([i915#118] / [i915#5138]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][180] ([i915#79]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [DMESG-WARN][182] ([i915#2867]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb7/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][184] ([i915#1849] / [i915#4098]) -> [PASS][185] +7 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [INCOMPLETE][186] -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         [FAIL][188] ([i915#2546]) -> [PASS][189] +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         [FAIL][190] -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_psr@cursor_mmap_cpu:
    - {shard-rkl}:        [SKIP][192] ([i915#1072]) -> [PASS][193] +2 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-4/igt@kms_psr@cursor_mmap_cpu.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][194] ([fdo#109441]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb5/igt@kms_psr@psr2_sprite_render.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@polling-parameterized:
    - {shard-rkl}:        [FAIL][196] ([i915#5639]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-rkl-1/igt@perf@polling-parameterized.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/igt@perf@polling-parameterized.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          [DMESG-WARN][198] ([i915#180]) -> [PASS][199] +1 similar issue
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl6/igt@perf_pmu@rc6-suspend.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl6/igt@perf_pmu@rc6-suspend.html

  * igt@syncobj_basic@bad-destroy:
    - shard-iclb:         [DMESG-WARN][200] ([i915#4391]) -> [PASS][201] +1 similar issue
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb7/igt@syncobj_basic@bad-destroy.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@syncobj_basic@bad-destroy.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-apl:          [FAIL][202] ([i915#1755]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl8/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl7/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Warnings ####

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][204] ([fdo#111068] / [i915#658]) -> [SKIP][205] ([i915#2920])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][206] ([i915#2920]) -> [SKIP][207] ([fdo#111068] / [i915#658])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215], [FAIL][216]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][217], [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223]) ([i915#3002] / [i915#4312])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl1/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl1/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl7/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl7/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl8/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl8/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl3/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl6/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl6/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl2/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl8/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl1/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl8/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7121]: https://gitlab.freedesktop.org/drm/intel/issues/7121
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7311]: https://gitlab.freedesktop.org/drm/intel/issues/7311
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7026 -> IGTPW_7999
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12289: 0bcfcba620c5d57661249e762a04254ed9274ab3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7999: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/index.html
  IGT_7026: ce0f97e7e0aa54c40049a8365b3d61773c92e588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/index.html

--===============2055302360397203051==
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
<tr><td><b>Series:</b></td><td>vm_bind: Add VM_BIND validation support (rev=
9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105881/">https://patchwork.freedesktop.org/series/105881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7999/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12289_full -&gt; IGTPW_7999_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7999_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7999_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7999=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec3_balancer@parallel-ordering} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-rkl-1/igt@gem_exec3_balancer@parallel-orderi=
ng.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_lmem_swapping@vm_bind} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_lmem_swapping@vm_bind.html">SK=
IP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_lmem_swapping@vm_bind@lmem0} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-dg1-13/igt@gem_lmem_swapping@vm_bind@lmem0.h=
tml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-apl3/igt@gem_pread@exhaustion.html">INCOMPLET=
E</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb2/igt@gem_pread@exhaustion.html">INCOMPLE=
TE</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-glk7/igt@gem_pread@exhaustion.html">INCOMPLET=
E</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@i915_vm_bind_sanity@basic.html">SK=
IP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12289_full and IGTPW_7999_=
full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_exec3_balancer@parallel-ordering:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec3_basic@basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@vm_bind:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@vm_bind@lmem0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity@basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7999_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb5/igt@api_intel_bb@crc32.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230<=
/a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb5/igt@api_intel_bb@crc32.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230<=
/a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_create@create-ext-cpu-access-b=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard=
-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-snb4/igt@gem_ctx_persistence@engines-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#2=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb2/igt@gem_exec_balancer@parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-icl=
b7/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_exec_balancer@parallel-orderin=
g.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_exec_capture@capture-invisible@=
smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6334">i915#6334</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb1/igt@gem_exec_capture@capture-invisible@=
smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6334">i915#6334</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_exec_capture@capture-recoverabl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6344">i915#6344</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb1/igt@gem_exec_capture@capture-recoverabl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6344">i915#6344</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/s=
hard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_exec_flush@basic-batch-kernel-=
default-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109313">fdo#109313</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb8/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613"=
>i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb7/igt@gem_lmem_swapping@heavy-random.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613=
">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-glk7/igt@gem_lmem_swapping@heavy-random.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_mmap@big-bo.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7311">i915#7=
311</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb5/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@gem_pwrite@basic-exhaustion.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
7311">i915#7311</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-snb5/igt@gem_pxp@reject-modify-context-protec=
tion-off-3.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +139 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb1/igt@gem_pxp@reject-modify-context-prote=
ction-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gem_pxp@reject-modify-context-prote=
ction-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-apl3/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb6/igt@gem_softpin@evict-snoop.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo#=
109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb1/igt@gem_softpin@evict-snoop.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo#=
109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@gen7_exec_parse@basic-allowed.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@gen9_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@gen9_exec_parse@bb-start-far.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856"=
>i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915=
#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb5/igt@i915_query@hwconfig_table.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i91=
5#6245</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb5/igt@i915_query@hwconfig_table.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i91=
5#6245</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb8/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-snb4/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-a-vga-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7999/shard-snb7/igt@kms_async_flips@alternate-sync-async-flip@=
pipe-a-vga-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5286">i915#5286</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111614">fdo#111614</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111615">fdo#111615</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705=
">i915#2705</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_big_joiner@invalid-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705=
">i915#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-apl7/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-glk3/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-snb2/igt@kms_chamelium@dp-crc-single.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-apl2/igt@kms_chamelium@dp-crc-single.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-glk6/igt@kms_chamelium@dp-edid-read.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb8/igt@kms_chamelium@hdmi-crc-single.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_color@ctm-0-75@pipe-a-edp-1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6946">i915#6946</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-apl7/igt@kms_content_protection@atomic-dpms@=
pipe-a-dp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/7121">i915#7121</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb1/igt@kms_content_protection@lic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7118">i=
915#7118</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb5/igt@kms_cursor_crc@cursor-offscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb6/igt@kms_cursor_crc@cursor-onscreen-512x=
170.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_cursor_crc@cursor-onscreen-512x=
170.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_cursor_crc@cursor-random-32x10=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_cursor_crc@cursor-random-512x5=
12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipb=
@atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7999/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor=
@atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#38=
40</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vb=
lank.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7999/shard-glk6/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_flip@2x-flip-vs-panning.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6375">i915#6375</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7999/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2546">i915#2546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +31 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-mo=
desetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6497">i915#6497</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +127 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-spr-indfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +174 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-t=
glb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-apl6/igt@kms_plane_alpha_blend@constant-alph=
a-max@pipe-b-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-glk2/igt@kms_plane_alpha_blend@constant-alph=
a-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb7/igt@kms_plane_lowres@tiling-4.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">f=
do#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5288">i915#5288</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_plane_scaling@planes-downscale-f=
actor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb6/igt@kms_prime@basic-crc-hybrid.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524">i9=
15#6524</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb8/igt@kms_prime@basic-crc-hybrid.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524">i9=
15#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-apl2/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_psr2_su@page_flip-p010@pipe-b-=
edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5939">i915#5939</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-iclb1/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10944=
1">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_psr@psr2_sprite_render.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i9=
15#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/346=
7">i915#3467</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb2/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb2/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk1/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard=
-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb3/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-apl2/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb1/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-glk5/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-iclb5/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo=
#109292</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb2/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo=
#109295</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
656">fdo#111656</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-apl6/igt@sysfs_clients@fair-3.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7999/shard-tglb7/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-glk3/igt@sysfs_clients@sema-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7999/shard-iclb6/igt@sysfs_clients@split-25.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
252">i915#6252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7999/shard-rkl-6/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">fdo#103375</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/sh=
ard-rkl-5/igt@gem_eio@in-flight-suspend.html">PASS</a> +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-=
dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/s=
hard-rkl-4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/=
shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7999/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i=
915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7999/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">PASS</a=
> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7276">i915#=
7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
999/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledx:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-tglb2/igt@gem_mmap_gtt@big-bo-tiledx.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7311">i915#7=
311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
99/shard-tglb3/igt@gem_mmap_gtt@big-bo-tiledx.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-6/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-5/ig=
t@gem_pread@snoop.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-tglb5/igt@gem_softpin@evict-single-offset.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#41=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_799=
9/shard-tglb3/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#25=
27</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_799=
9/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-4/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/i=
gt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-4/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#109308</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-=
rkl-6/igt@i915_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12289/shard-tglb2/igt@i915_selftest@live@hugepages.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7311">i915#=
7311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
999/shard-tglb5/igt@i915_selftest@live@hugepages.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12289/shard-iclb5/igt@i915_selftest@live@hugepages.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7311">i915#=
7311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
999/shard-iclb3/igt@i915_selftest@live@hugepages.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb7/igt@i915_selftest@perf@request.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2=
867</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4391">=
i915#4391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7999/shard-iclb3/igt@i915_selftest@perf@request.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@kms_big_fb@x-tiled-max=
-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +16 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118"=
>i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7999/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">=
i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7999/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb7/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i=
915#2867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7999/shard-iclb1/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">PASS</a> +7 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-draw-render.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7999/shard-tglb5/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-spr-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
hrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-draw-render.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7999/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-4/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-=
rkl-6/igt@kms_psr@cursor_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb5/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/s=
hard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-rkl-1/igt@perf@polling-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/sha=
rd-rkl-5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-apl6/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-=
apl6/igt@perf_pmu@rc6-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@syncobj_basic@bad-destroy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb7/igt@syncobj_basic@bad-destroy.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#43=
91</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_799=
9/shard-iclb5/igt@syncobj_basic@bad-destroy.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-apl8/igt@sysfs_heartbeat_interval@precise@vecs0.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">i=
915#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7999/shard-apl7/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a=
></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7999/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12289/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7999/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12289/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12289/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12289/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl8/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
12289/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/shard-apl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_122=
89/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl2/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7999/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7999/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl1/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7999/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/shard-apl3/igt@runner@aborted.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002"=
>i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7026 -&gt; IGTPW_7999</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12289: 0bcfcba620c5d57661249e762a04254ed9274ab3 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7999: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7999/index.htm=
l<br />
  IGT_7026: ce0f97e7e0aa54c40049a8365b3d61773c92e588 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2055302360397203051==--
