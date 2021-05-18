Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 May 2021 20:00:31 -0000
Message-ID: <162136803136.23336.8626834415979960201@emeril.freedesktop.org>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Flease=3A_Add_subtest_description_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0047040105=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0047040105==
Content-Type: multipart/alternative;
 boundary="===============5732001695707311606=="

--===============5732001695707311606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_lease: Add subtest description (rev5)
URL   : https://patchwork.freedesktop.org/series/89869/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6087_full -> IGTPW_5818_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5818_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5818_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5818_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  
#### Warnings ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-glk:          [INCOMPLETE][2] ([i915#3468]) -> [INCOMPLETE][3] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  
Known issues
------------

  Here are the changes found in IGTPW_5818_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][4] ([i915#3457]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk8/igt@api_intel_bb@blit-noreloc-purge-cache.html

  * igt@api_intel_bb@delta-check:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][5] ([i915#3457]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@api_intel_bb@delta-check.html

  * igt@api_intel_bb@intel-bb-blit-x:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#3471])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@api_intel_bb@intel-bb-blit-x.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@api_intel_bb@intel-bb-blit-x.html

  * igt@api_intel_bb@offset-control:
    - shard-glk:          NOTRUN -> [DMESG-WARN][8] ([i915#3457])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk2/igt@api_intel_bb@offset-control.html

  * igt@drm_read@fault-buffer:
    - shard-apl:          NOTRUN -> [DMESG-WARN][9] ([i915#3457])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@drm_read@fault-buffer.html

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#111827])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#111827])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#1839]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb6/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][13] ([i915#3002])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][14] ([i915#3002])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][15] ([i915#3002])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][16] ([i915#3002])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1099]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][18] -> [TIMEOUT][19] ([i915#2369] / [i915#3063] / [i915#3457])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [PASS][20] -> [TIMEOUT][21] ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb4/igt@gem_eio@unwedge-stress.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][22] ([i915#3354] / [i915#3457])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#2846] / [i915#3457])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][25] ([i915#2842] / [i915#3457]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][26] ([i915#2842] / [i915#3457]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][27] ([i915#2842] / [i915#3457])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3457]) +24 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#2842] / [i915#3457])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#2842] / [i915#3457])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#2842] / [i915#3457])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fence@keep-in-fence@rcs0:
    - shard-glk:          [PASS][35] -> [INCOMPLETE][36] ([i915#3457]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@gem_exec_fence@keep-in-fence@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk2/igt@gem_exec_fence@keep-in-fence@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109313])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109313])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109283])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109283])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - shard-apl:          NOTRUN -> [FAIL][41] ([i915#3457]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][42] ([i915#3468]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          NOTRUN -> [INCOMPLETE][43] ([i915#3468]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][44] ([i915#3468]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-iclb:         [PASS][45] -> [INCOMPLETE][46] ([i915#2502])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb7/igt@gem_mmap_gtt@medium-copy-xy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb7/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][48] ([i915#2658])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][49] ([i915#2658])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][50] ([i915#2658])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271]) +188 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-apl:          NOTRUN -> [INCOMPLETE][52] ([i915#3468]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#768]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][54] ([i915#3468]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][55] ([i915#3468]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109312]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109312]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3323])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3297]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-kbl:          NOTRUN -> [FAIL][60] ([i915#3324])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl2/igt@gem_userptr_blits@set-cache-level.html
    - shard-tglb:         NOTRUN -> [FAIL][61] ([i915#3324])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gem_userptr_blits@set-cache-level.html
    - shard-iclb:         NOTRUN -> [FAIL][62] ([i915#3324])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb5/igt@gem_userptr_blits@set-cache-level.html
    - shard-glk:          NOTRUN -> [FAIL][63] ([i915#3324])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk8/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3297]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_wait@busy@bcs0:
    - shard-apl:          [PASS][65] -> [FAIL][66] ([i915#3457]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_wait@busy@bcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_wait@busy@bcs0.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][67] ([i915#180] / [i915#3457]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109289]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109289]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#112306]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#112306]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_hangman@error-state-capture@bcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][72] ([i915#3457]) +14 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl7/igt@i915_hangman@error-state-capture@bcs0.html

  * igt@i915_module_load@reload:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][73] ([i915#3457]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#3288])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][75] ([i915#3343])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@cursor:
    - shard-glk:          [PASS][76] -> [DMESG-WARN][77] ([i915#3457])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@i915_pm_rpm@cursor.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-iclb:         [PASS][78] -> [DMESG-WARN][79] ([i915#3457])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb6/igt@i915_pm_rpm@cursor-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111644] / [i915#1397] / [i915#2411])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#110892])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-snb:          NOTRUN -> [DMESG-WARN][82] ([i915#3457])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][83] ([i915#3457])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109288])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109288])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109303])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109303])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][88] -> [DMESG-WARN][89] ([i915#180])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271]) +142 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#110725] / [fdo#111614]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#111614]) +5 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#110723])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#111615]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#2705])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@kms_big_joiner@invalid-modeset.html
    - shard-kbl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2705])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#2705])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk1/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2705])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][100] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][102] ([i915#1149]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@kms_color@pipe-b-degamma.html
    - shard-glk:          NOTRUN -> [FAIL][103] ([i915#71])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][104] ([i915#1149])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-c-degamma:
    - shard-glk:          [PASS][105] -> [FAIL][106] ([i915#71]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk1/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109278] / [i915#1149]) +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][111] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][112] ([i915#1319])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#3116]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#3116]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][115] ([i915#2105])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#111828])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb8/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109300] / [fdo#111066])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          NOTRUN -> [FAIL][118] ([i915#3457]) +5 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#3319] / [i915#3457]) +4 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109278] / [fdo#109279] / [i915#3457]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#3359] / [i915#3457]) +8 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-iclb:         NOTRUN -> [FAIL][122] ([i915#3457]) +13 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-glk:          NOTRUN -> [FAIL][123] ([i915#3444] / [i915#3457]) +12 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          NOTRUN -> [FAIL][124] ([i915#3444] / [i915#3457]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][125] -> [FAIL][126] ([i915#3444] / [i915#3457])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-iclb:         [PASS][127] -> [FAIL][128] ([i915#3457])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen:
    - shard-tglb:         [PASS][129] -> [FAIL][130] ([i915#2124] / [i915#3457])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          NOTRUN -> [FAIL][131] ([i915#3444] / [i915#3457]) +17 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:
    - shard-snb:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#3457]) +33 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][133] -> [FAIL][134] ([i915#3444] / [i915#3457]) +3 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-tglb:         NOTRUN -> [FAIL][135] ([i915#2124] / [i915#3457]) +21 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
    - shard-apl:          [PASS][136] -> [FAIL][137] ([i915#3444] / [i915#3457])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:
    - shard-glk:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#3457]) +23 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][139] ([fdo#109278] / [i915#3457]) +25 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][140] ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues
   [140]: https://in

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/index.html

--===============5732001695707311606==
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
<tr><td><b>Series:</b></td><td>tests/kms_lease: Add subtest description (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89869/">https://patchwork.freedesktop.org/series/89869/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6087_full -&gt; IGTPW_5818_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5818_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5818_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5818_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5818_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk8/igt@api_intel_bb@blit-noreloc-purge-cache.html">DMESG-FAIL</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@api_intel_bb@delta-check.html">DMESG-WARN</a> ([i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@api_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@api_intel_bb@intel-bb-blit-x.html">FAIL</a> ([i915#3471])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@offset-control:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk2/igt@api_intel_bb@offset-control.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@drm_read@fault-buffer:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@drm_read@fault-buffer.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb6/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3457])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb4/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3457]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@keep-in-fence@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@gem_exec_fence@keep-in-fence@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk2/igt@gem_exec_fence@keep-in-fence@rcs0.html">INCOMPLETE</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@gem_exec_schedule@u-fairslice@vecs0.html">FAIL</a> ([i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@gem_mmap_gtt@fault-concurrent.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb7/igt@gem_mmap_gtt@medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb7/igt@gem_mmap_gtt@medium-copy-xy.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +188 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl2/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb5/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk8/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_wait@busy@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@gem_wait@busy@bcs0.html">FAIL</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-capture@bcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl7/igt@i915_hangman@error-state-capture@bcs0.html">DMESG-WARN</a> ([i915#3457]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@i915_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk4/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb6/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@i915_pm_rpm@cursor-dpms.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@i915_pm_rps@min-max-config-loaded.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl2/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +142 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk1/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +16 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb8/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb7/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359] / [i915#3457]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3457]) +13 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3444] / [i915#3457]) +12 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-128x128-offscreen.html">FAIL</a> ([i915#2124] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL</a> ([i915#2124] / [i915#3457]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html">FAIL</a> ([i915#3444] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-glk5/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html">SKIP</a> ([fdo#109271] / [i915#3457]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5818/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278] / [i915#3457]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://in">SKIP</a> ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5732001695707311606==--

--===============0047040105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0047040105==--
