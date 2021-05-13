Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 May 2021 21:36:38 -0000
Message-ID: <162094179845.26534.7207461629414016096@emeril.freedesktop.org>
References: <20210513145352.2790280-1-markyacoub@chromium.org>
In-Reply-To: <20210513145352.2790280-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpanel=5Ffitting=3A_Move_Intel_GEN_check_under_a_is=5Fi915?=
 =?utf-8?q?=5Fdevice?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1103374364=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1103374364==
Content-Type: multipart/alternative;
 boundary="===============9107615275859980371=="

--===============9107615275859980371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_panel_fitting: Move Intel GEN check under a is_i915_device
URL   : https://patchwork.freedesktop.org/series/90136/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10074_full -> IGTPW_5811_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5811_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5811_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5811_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gem_mmap_gtt@fault-concurrent-x.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-64:
    - shard-tglb:         NOTRUN -> [FAIL][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_plane_cursor@pipe-b-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-b-primary-size-256:
    - shard-snb:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-size-256.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-glk:          [FAIL][8] ([i915#3457]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-128:
    - shard-tglb:         [FAIL][10] ([i915#3457]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:
    - shard-glk:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10074_full and IGTPW_5811_full:

### New IGT tests (2) ###

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  

Known issues
------------

  Here are the changes found in IGTPW_5811_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@delta-check:
    - shard-apl:          NOTRUN -> [DMESG-WARN][14] ([i915#3457])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@api_intel_bb@delta-check.html

  * igt@api_intel_bb@offset-control:
    - shard-snb:          NOTRUN -> [DMESG-WARN][15] ([i915#3457]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@api_intel_bb@offset-control.html

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#111827])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#111827])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@feature_discovery@chamelium.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][18] ([i915#3002])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][19] ([i915#3002])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][20] ([i915#3002])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1099]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@suspend:
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#1185])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_eio@suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_eio@suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][25] -> [TIMEOUT][26] ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][27] ([i915#3354] / [i915#3457])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][28] ([i915#2846] / [i915#3457])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#2842] / [i915#3457])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][31] ([i915#2842] / [i915#3457])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][32] ([i915#2842] / [i915#3457]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#2842] / [i915#3457])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109283])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112283]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][38] ([i915#2389] / [i915#3457]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][39] ([i915#2389] / [i915#3457]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][40] ([i915#2389] / [i915#3457]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][41] ([i915#2389] / [i915#3457])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_schedule@preempt@vcs0:
    - shard-glk:          NOTRUN -> [FAIL][42] ([i915#3457]) +45 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@preempt@vcs0.html

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#3457]) +44 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@submit-golden-slice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][45] -> [DMESG-WARN][46] ([i915#118] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#284])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#307])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_mmap_gtt@big-copy.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-glk:          NOTRUN -> [FAIL][50] ([i915#307])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-glk:          [PASS][51] -> [INCOMPLETE][52] ([i915#3468]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-snb:          NOTRUN -> [INCOMPLETE][53] ([i915#3468]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-tglb:         [PASS][54] -> [INCOMPLETE][55] ([i915#3468])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [PASS][56] -> [FAIL][57] ([i915#307]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-glk:          NOTRUN -> [INCOMPLETE][58] ([i915#3468])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@gem_mmap_gtt@fault-concurrent-x.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][59] ([i915#3468])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-apl:          NOTRUN -> [FAIL][60] ([i915#3476])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctxn.html
    - shard-glk:          NOTRUN -> [FAIL][61] ([i915#3476])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#768])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-apl:          NOTRUN -> [INCOMPLETE][63] ([i915#3468]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_spin_batch@engines@vcs0:
    - shard-apl:          NOTRUN -> [FAIL][64] ([i915#2898] / [i915#3457]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_spin_batch@engines@vcs0.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3323])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3297]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#3297]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][68] ([i915#3318] / [i915#3457])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_wait@write-busy@rcs0:
    - shard-apl:          NOTRUN -> [FAIL][69] ([i915#3457]) +10 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_wait@write-busy@rcs0.html

  * igt@gem_workarounds@suspend-resume:
    - shard-snb:          [PASS][70] -> [TIMEOUT][71] ([i915#2808] / [i915#3457])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_workarounds@suspend-resume.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][72] ([i915#180] / [i915#3457])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109289]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2527])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#112306]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#112306]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#1937])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#1937])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@cursor:
    - shard-glk:          NOTRUN -> [DMESG-WARN][79] ([i915#3457])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109293] / [fdo#109506])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109506] / [i915#2411])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@gem-mmap-type@uc:
    - shard-glk:          [PASS][83] -> [DMESG-WARN][84] ([i915#3475])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk5/igt@i915_pm_rpm@gem-mmap-type@uc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@i915_pm_rpm@gem-mmap-type@uc.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][85] ([i915#2411])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@gem-mmap-type@uc.html
    - shard-kbl:          [PASS][86] -> [DMESG-WARN][87] ([i915#3475])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl2/igt@i915_pm_rpm@gem-mmap-type@uc.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@i915_pm_rpm@gem-mmap-type@uc.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#110892]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][89] ([i915#3457]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_rps@reset.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][90] ([i915#3457])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@i915_pm_rps@reset.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][91] ([i915#3457])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][92] ([i915#3457]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@i915_pm_sseu@full-enable.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109288])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109288])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109303])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109303])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109302])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109302])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][99] ([i915#3462])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][100] ([i915#2373])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][101] ([i915#1759] / [i915#2291])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][102] ([i915#2782])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#111614]) +6 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#111615]) +7 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#110723]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2705])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_big_joiner@invalid-modeset.html
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2705])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2705])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_big_joiner@invalid-modeset.html
    - shard-glk:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#2705])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2705])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-d-bad-rotation-90:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109278]) +19 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_ccs@pipe-d-bad-rotation-90.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109284] / [fdo#111827]) +21 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][115] ([fdo#109271] / [fdo#111827]) +27 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][117] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color@pipe-a-degamma:
    - shard-glk:          NOTRUN -> [FAIL][118] ([fdo#108145] / [i915#71])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk4/igt@kms_color@pipe-a-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][119] ([i915#1149]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][120] ([i915#1149]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_color@pipe-b-degamma.html
    - shard-glk:          NOTRUN -> [FAIL][121] ([i915#71])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-c-gamma:
    - shard-glk:          [PASS][122] -> [FAIL][123] ([i915#71])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk7/igt@kms_color@pipe-c-gamma.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109278] / [i915#1149]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][125] ([fdo#109271] / [fdo#111827]) +30 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][127] ([i915#1319]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([i915#3116])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#3116])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([fdo#111828]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          NOTRUN -> [FAIL][132] ([i915#3444] / [i915#3457]) +7 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-tglb:         [PASS][133] -> [FAIL][134] ([i915#2124] / [i915#3457])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-apl:          [PASS][135] -> [FAIL][136] ([i915#3444] / [i915#3457]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][137] ([i915#3319] / [i915#3457]) +6 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][138] ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html

--===============9107615275859980371==
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
<tr><td><b>Series:</b></td><td>tests/kms_panel_fitting: Move Intel GEN check under a is_i915_device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90136/">https://patchwork.freedesktop.org/series/90136/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10074_full -&gt; IGTPW_5811_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5811_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5811_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5811_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-64:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_plane_cursor@pipe-b-overlay-size-64.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-256:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-size-256.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-viewport-size-128:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10074_full and IGTPW_5811_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5811_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@api_intel_bb@delta-check.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@offset-control:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@api_intel_bb@offset-control.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_eio@suspend.html">INCOMPLETE</a> ([i915#1185])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt@vcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@preempt@vcs0.html">FAIL</a> ([i915#3457]) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@submit-golden-slice@rcs0.html">FAIL</a> ([i915#3457]) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_mmap_gtt@big-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_mmap_gtt@big-copy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> ([i915#3476])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> ([i915#3476])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">INCOMPLETE</a> ([i915#3468]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_spin_batch@engines@vcs0.html">FAIL</a> ([i915#2898] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_wait@write-busy@rcs0.html">FAIL</a> ([i915#3457]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_workarounds@suspend-resume.html">TIMEOUT</a> ([i915#2808] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([fdo#112306]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk5/igt@i915_pm_rpm@gem-mmap-type@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#3475])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#2411])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl2/igt@i915_pm_rpm@gem-mmap-type@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#3475])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_rps@reset.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@i915_pm_rps@reset.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@i915_pm_sseu@full-enable.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_ccs@pipe-d-bad-rotation-90.html">SKIP</a> ([fdo#109278]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk4/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk7/igt@kms_color@pipe-c-gamma.html">FAIL</a> ([i915#71])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_content_protection@type1.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html">FAIL</a> ([i915#2124] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319] / [i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============9107615275859980371==--

--===============1103374364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1103374364==--
