Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 May 2021 14:48:14 -0000
Message-ID: <162091729403.26535.1922670486233369146@emeril.freedesktop.org>
References: <20210513090700.7271-1-karthik.b.s@intel.com>
In-Reply-To: <20210513090700.7271-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Fdsc=3A_Bug_fix_for_DP_on_Pipe_A?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1994913378=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1994913378==
Content-Type: multipart/alternative;
 boundary="===============7245104918739776379=="

--===============7245104918739776379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_dp_dsc: Bug fix for DP on Pipe A
URL   : https://patchwork.freedesktop.org/series/90121/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10074_full -> IGTPW_5810_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5810_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5810_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5810_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-snb:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-128:
    - shard-tglb:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_plane_cursor@pipe-c-viewport-size-128.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10074_full and IGTPW_5810_full:

### New IGT tests (2) ###

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - Statuses : 5 pass(s)
    - Exec time: [0.34, 1.42] s

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - Statuses : 5 pass(s)
    - Exec time: [0.38, 2.50] s

  

Known issues
------------

  Here are the changes found in IGTPW_5810_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@execbuf-with-allocator:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][7] ([i915#3457]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@api_intel_allocator@execbuf-with-allocator.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][8] ([i915#3457]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@api_intel_allocator@execbuf-with-allocator.html

  * igt@api_intel_bb@intel-bb-blit-y:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#3471])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@api_intel_bb@intel-bb-blit-y.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@api_intel_bb@intel-bb-blit-y.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][11] ([i915#3002]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][12] ([i915#3002])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][13] ([i915#180] / [i915#3457]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][15] -> [TIMEOUT][16] ([i915#2369] / [i915#3063] / [i915#3457])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_eio@unwedge-stress.html
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#3457]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [PASS][18] -> [TIMEOUT][19] ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][20] -> [FAIL][21] ([i915#2842] / [i915#3457])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#2842] / [i915#3457])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2842] / [i915#3457])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][24] ([i915#2842] / [i915#3457])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#3457]) +29 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@gem_exec_fence@parallel@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#112283]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#2389] / [i915#3457]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][29] ([i915#2389] / [i915#3457]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          NOTRUN -> [DMESG-WARN][30] ([i915#118] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-glk:          [PASS][31] -> [INCOMPLETE][32] ([i915#3468]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][33] ([i915#3468]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
    - shard-apl:          [PASS][34] -> [INCOMPLETE][35] ([i915#3468])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-iclb:         [PASS][36] -> [INCOMPLETE][37] ([i915#3468])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][38] ([i915#3468])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-x.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][39] ([i915#3468])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-glk:          [PASS][40] -> [INCOMPLETE][41] ([i915#2502])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@gem_mmap_gtt@medium-copy-xy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_offset@clear:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#3160])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb7/igt@gem_mmap_offset@clear.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_offset@clear.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][45] ([i915#2658])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][46] ([i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-apl:          NOTRUN -> [INCOMPLETE][47] ([i915#3468]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl8/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109312]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109312])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3323])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-glk:          NOTRUN -> [DMESG-WARN][51] ([i915#3002]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3297]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#3297]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109289]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109289]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#2527])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gen9_exec_parse@bb-large.html
    - shard-apl:          NOTRUN -> [FAIL][57] ([i915#3296])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#112306]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#112306]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_hangman@engine-error@bcs0:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][60] ([i915#3457]) +9 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb3/igt@i915_hangman@engine-error@bcs0.html

  * igt@i915_hangman@engine-error@vcs0:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][61] ([i915#3457]) +7 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_hangman@engine-error@vcs0.html

  * igt@i915_hangman@engine-error@vecs0:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271]) +207 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][63] ([i915#454])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#1937])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#1937])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-apl:          NOTRUN -> [DMESG-WARN][66] ([i915#3457])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@cursor:
    - shard-glk:          NOTRUN -> [DMESG-WARN][67] ([i915#3457]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk2/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-apl:          [PASS][68] -> [DMESG-WARN][69] ([i915#3457])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl6/igt@i915_pm_rpm@cursor-dpms.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111644] / [i915#1397] / [i915#2411])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#110892])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109506] / [i915#2411]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][74] ([i915#3462])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][75] ([i915#2373])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][76] ([i915#1759] / [i915#2291])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][77] ([i915#2782])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - shard-snb:          NOTRUN -> [DMESG-WARN][78] ([i915#3457])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@mman.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111614]) +6 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#110723])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111615]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic:
    - shard-glk:          [PASS][83] -> [FAIL][84] ([fdo#108145])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html

  * igt@kms_ccs@pipe-d-bad-rotation-90:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278]) +16 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_ccs@pipe-d-bad-rotation-90.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109284] / [fdo#111827]) +20 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109284] / [fdo#111827]) +14 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-a-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][90] ([i915#1149]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-a-gamma:
    - shard-glk:          NOTRUN -> [FAIL][91] ([i915#71])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_color@pipe-a-gamma.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][92] ([i915#1149]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-c-gamma:
    - shard-glk:          [PASS][93] -> [FAIL][94] ([i915#71]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk7/igt@kms_color@pipe-c-gamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][98] ([i915#1319]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#111828]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-glk:          [PASS][101] -> [FAIL][102] ([i915#3444] / [i915#3457]) +9 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-tglb:         [PASS][103] -> [FAIL][104] ([i915#2124] / [i915#3457])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-snb:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#3457]) +30 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#3319] / [i915#3457]) +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-snb:          NOTRUN -> [FAIL][107] ([i915#3457]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-random:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#3457]) +16 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#3457]) +10 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][111] ([i915#3444] / [i915#3457]) +14 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-iclb:         NOTRUN -> [FAIL][112] ([i915#3457]) +11 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-kbl:          [PASS][113] -> [FAIL][114] ([i915#3444] / [i915#3457])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
    - shard-apl:          [PASS][115] -> [FAIL][116] ([i915#3444] / [i915#3457]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#3359] / [i915#3457]) +5 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-glk:          NOTRUN -> [FAIL][118] ([i915#3444] / [i915#3457]) +10 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-apl:          NOTRUN -> [FAIL][119] ([i915#3444] / [i915#3457]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][120] ([i915#180] / [i915#3457])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109278] / [i915#3457]) +16 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:
    - shard-tglb:         NOTRUN -> [FAIL][123] ([i915#2124] / [i915#3457]) +20 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#3457]) +33 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
    - shard-tglb:         NOTRUN -> [FAIL][125] ([i915#2124] / [i915#2411] / [i915#3457])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [PASS][126] -> [FAIL][127] ([i915#70]) +3 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([fdo#109274] / [fdo#109278]) +5 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][129] ([i915#155] / [i915#180] / [i915#636])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109274]) +9 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([fdo#111825]) +73 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html

--===============7245104918739776379==
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
<tr><td><b>Series:</b></td><td>tests/kms_dp_dsc: Bug fix for DP on Pipe A</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90121/">https://patchwork.freedesktop.org/series/90121/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10074_full -&gt; IGTPW_5810_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5810_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5810_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5810_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-64:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-128:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_plane_cursor@pipe-c-viewport-size-128.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10074_full and IGTPW_5810_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.34, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.38, 2.50] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5810_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@api_intel_allocator@execbuf-with-allocator.html">DMESG-WARN</a> ([i915#3457]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@api_intel_allocator@execbuf-with-allocator.html">DMESG-FAIL</a> ([i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@api_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@api_intel_bb@intel-bb-blit-y.html">FAIL</a> ([i915#3471])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3457])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3457]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@gem_exec_fence@parallel@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_exec_fence@parallel@vcs0.html">FAIL</a> ([i915#3457]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@gem_mmap_gtt@medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@gem_mmap_gtt@medium-copy-xy.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb7/igt@gem_mmap_offset@clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_offset@clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl8/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">INCOMPLETE</a> ([i915#3468]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([fdo#112306]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb3/igt@i915_hangman@engine-error@bcs0.html">DMESG-WARN</a> ([i915#3457]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_hangman@engine-error@vcs0.html">DMESG-WARN</a> ([i915#3457]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html">SKIP</a> ([fdo#109271]) +207 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rc6_residency@rc6-fence.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk2/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl6/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rpm@cursor-dpms.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@mman.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html">FAIL</a> ([fdo#108145])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_ccs@pipe-d-bad-rotation-90.html">SKIP</a> ([fdo#109278]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_color@pipe-a-gamma.html">FAIL</a> ([i915#71])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk7/igt@kms_color@pipe-c-gamma.html">FAIL</a> ([i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html">FAIL</a> ([i915#3444] / [i915#3457]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html">FAIL</a> ([i915#2124] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">SKIP</a> ([fdo#109271] / [i915#3457]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html">FAIL</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-32x32-random.html">SKIP</a> ([fdo#109271] / [i915#3457]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> ([i915#3444] / [i915#3457]) +14 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> ([i915#3457]) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x256-random:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html">FAIL</a> ([i915#3444] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html">SKIP</a> ([i915#3359] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> ([i915#3444] / [i915#3457]) +10 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> ([i915#3444] / [i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-FAIL</a> ([i915#180] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278] / [i915#3457]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html">FAIL</a> ([i915#2124] / [i915#3457]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271] / [i915#3457]) +33 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">FAIL</a> ([i915#2124] / [i915#2411] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">FAIL</a> ([i915#70]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([fdo#109274]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile</p>
</li>
</ul>

</body>
</html>

--===============7245104918739776379==--

--===============1994913378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1994913378==--
