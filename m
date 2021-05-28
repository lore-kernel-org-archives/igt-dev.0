Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 May 2021 18:52:45 -0000
Message-ID: <162222796534.11840.7104402012018467895@emeril.freedesktop.org>
References: <20210527192750.6453-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210527192750.6453-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IHRo?=
 =?utf-8?q?e_multiprocess_mode_of_intel_allocator_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0106215781=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0106215781==
Content-Type: multipart/alternative;
 boundary="===============1414078515890939563=="

--===============1414078515890939563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix the multiprocess mode of intel allocator (rev3)
URL   : https://patchwork.freedesktop.org/series/90481/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10145_full -> IGTPW_5858_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5858_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5858_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5858_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_bb@object-noreloc-keep-cache-random:
    - shard-iclb:         [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-iclb5/igt@api_intel_bb@object-noreloc-keep-cache-random.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@api_intel_bb@object-noreloc-keep-cache-random.html
    - shard-tglb:         [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-tglb1/igt@api_intel_bb@object-noreloc-keep-cache-random.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb5/igt@api_intel_bb@object-noreloc-keep-cache-random.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@api_intel_bb@object-noreloc-keep-cache-random.html

  * igt@api_intel_bb@object-noreloc-purge-cache-random:
    - shard-glk:          [PASS][6] -> [FAIL][7] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk6/igt@api_intel_bb@object-noreloc-purge-cache-random.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@api_intel_bb@object-noreloc-purge-cache-random.html
    - shard-kbl:          [PASS][8] -> [FAIL][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-kbl1/igt@api_intel_bb@object-noreloc-purge-cache-random.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@api_intel_bb@object-noreloc-purge-cache-random.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10145_full and IGTPW_5858_full:

### New IGT tests (4) ###

  * igt@api_intel_allocator@random-allocator@multiprocess:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@api_intel_allocator@reloc-allocator@multiprocess:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@api_intel_allocator@simple-allocator@multiprocess:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_media_fill@media-fill@smem:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5858_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#111827])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#111827])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#658]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][13] ([i915#3002])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099]) +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][16] ([i915#3354])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][21] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][22] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109283]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-glk:          NOTRUN -> [FAIL][25] ([i915#2389]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][26] ([i915#2389]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][27] ([i915#2389]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][28] ([i915#2389]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][29] ([i915#2389]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          NOTRUN -> [DMESG-WARN][30] ([i915#118] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111656])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-glk:          [PASS][32] -> [INCOMPLETE][33] ([i915#2055] / [i915#3468])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][34] ([i915#2055] / [i915#3468])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][35] ([i915#3468]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#307])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-apl:          NOTRUN -> [INCOMPLETE][38] ([i915#3468]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#3468])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
    - shard-glk:          [PASS][41] -> [INCOMPLETE][42] ([i915#3468])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-snb:          NOTRUN -> [INCOMPLETE][43] ([i915#3468])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb6/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#768]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#3297]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][48] ([i915#3002])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl8/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][49] ([i915#3002])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][50] ([i915#2724])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [FAIL][51] ([i915#3318])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         NOTRUN -> [TIMEOUT][52] ([i915#2795])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb6/igt@gem_vm_create@destroy-race.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109289])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb8/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#112306])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#2527])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@gen9_exec_parse@bb-large.html
    - shard-kbl:          NOTRUN -> [FAIL][56] ([i915#3296])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#2856])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#1902])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109289] / [fdo#111719])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111644] / [i915#1397] / [i915#2411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110892])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109288])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109288])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][64] ([i915#3462])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@i915_selftest@live@execlists.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271]) +176 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111614]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#2705])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271]) +493 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +33 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278] / [i915#1149]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][78] ([i915#1319]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109300] / [fdo#111066])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#3116])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][81] ([i915#1319])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][82] -> [FAIL][83] ([i915#3444]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
    - shard-glk:          [PASS][84] -> [FAIL][85] ([i915#3444]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
    - shard-apl:          [PASS][86] -> [FAIL][87] ([i915#3444])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3319]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3359]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278]) +32 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109279] / [i915#3359]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +284 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109274] / [fdo#109278]) +6 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][95] -> [INCOMPLETE][96] ([i915#180] / [i915#1982])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109274]) +8 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][98] ([i915#2122])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][99] ([i915#180])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2587])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2672])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2672])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109280]) +40 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#111825]) +43 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271]) +139 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#533]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk8/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][108] ([i915#180]) +4 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][109] ([fdo#108145] / [i915#265]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][110] ([fdo#108145] / [i915#265]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][111] ([fdo#108145] / [i915#265]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#111615]) +4 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2733])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2733])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2733])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk9/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#658]) +6 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl3/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#2920])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html
    - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#658]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@page_flip:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#658]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109642] / [fdo#111068] / [i915#658])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109441]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][122] ([i915#132] / [i915#3467]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][123] ([IGT#2])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109309])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109309])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#533]) +4 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([i915#2530]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-complete.html
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#2530])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([fdo#109289]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][130] -> [FAIL][131] ([i915#1542])
   [130]: https:/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/index.html

--===============1414078515890939563==
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
<tr><td><b>Series:</b></td><td>Fix the multiprocess mode of intel allocator (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90481/">https://patchwork.freedesktop.org/series/90481/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10145_full -&gt; IGTPW_5858_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5858_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5858_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5858_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-random:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-iclb5/igt@api_intel_bb@object-noreloc-keep-cache-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@api_intel_bb@object-noreloc-keep-cache-random.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-tglb1/igt@api_intel_bb@object-noreloc-keep-cache-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb5/igt@api_intel_bb@object-noreloc-keep-cache-random.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@api_intel_bb@object-noreloc-keep-cache-random.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-random:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk6/igt@api_intel_bb@object-noreloc-purge-cache-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@api_intel_bb@object-noreloc-purge-cache-random.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-kbl1/igt@api_intel_bb@object-noreloc-purge-cache-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@api_intel_bb@object-noreloc-purge-cache-random.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10145_full and IGTPW_5858_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@api_intel_allocator@random-allocator@multiprocess:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reloc-allocator@multiprocess:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@multiprocess:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill@smem:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5858_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb6/igt@gem_mmap_gtt@fault-concurrent.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl8/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb6/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb8/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +176 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +493 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb8/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3444]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3444]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278]) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html">SKIP</a> ([fdo#109271]) +284 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10145/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">INCOMPLETE</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109280]) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +139 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk8/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk9/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-kbl3/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-glk8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-tglb1/igt@nouveau_crc@pipe-b-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5858/shard-iclb7/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href="https:/">PASS</a> -&gt; [FAIL][131] ([i915#1542])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1414078515890939563==--

--===============0106215781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0106215781==--
