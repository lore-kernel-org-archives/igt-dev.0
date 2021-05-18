Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 May 2021 18:19:48 -0000
Message-ID: <162136198827.23334.11550328247511581770@emeril.freedesktop.org>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0749243113=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0749243113==
Content-Type: multipart/alternative;
 boundary="===============2637805564949352941=="

--===============2637805564949352941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev5)
URL   : https://patchwork.freedesktop.org/series/87570/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6087_full -> IGTPW_5817_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5817_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5817_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5817_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-apl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * {igt@gem_pxp@create-regular-context-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +12 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb3/igt@gem_pxp@create-regular-context-1.html

  * {igt@gem_pxp@hw-rejects-pxp-context} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk6/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-iclb:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-snb:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb6/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-kbl:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl1/igt@gem_pxp@hw-rejects-pxp-context.html

  * {igt@gem_pxp@protected-encrypted-src-copy-not-readible} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][9] +10 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@i915_selftest@perf@request:
    - shard-tglb:         [PASS][10] -> [DMESG-FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb3/igt@i915_selftest@perf@request.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@i915_selftest@perf@request.html

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:
    - shard-glk:          [PASS][12] -> [FAIL][13] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk6/igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes}:
    - shard-glk:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  
New tests
---------

  New tests have been introduced between IGT_6087_full and IGTPW_5817_full:

### New IGT tests (20) ###

  * igt@gem_pxp@create-protected-buffer:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@create-regular-buffer:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_pxp@create-regular-context-1:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@create-regular-context-2:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_pxp@create-valid-protected-context:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@display-protected-crc-with-hdcp:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@display-protected-crc-without-hdcp:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_pxp@fail-invalid-protected-context:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_pxp@hw-rejects-pxp-context:
    - Statuses : 4 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@reject-modify-context-protection-on:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5817_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][16] ([i915#3457]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@api_intel_bb@blit-noreloc-purge-cache.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][17] ([i915#3457]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@api_intel_bb@blit-noreloc-purge-cache.html

  * igt@api_intel_bb@offset-control:
    - shard-apl:          NOTRUN -> [DMESG-WARN][18] ([i915#3457]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@api_intel_bb@offset-control.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][19] ([i915#3457])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@api_intel_bb@offset-control.html

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#111827])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#111827])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@feature_discovery@chamelium.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][22] ([i915#3002])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][23] ([i915#3002])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][24] ([i915#3002])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][25] ([i915#3002])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][26] ([i915#180] / [i915#3457]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1099]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#118] / [i915#3457] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@gem_ctx_persistence@many-contexts.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@unwedge-stress:
    - shard-apl:          NOTRUN -> [FAIL][30] ([i915#3457]) +10 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> [FAIL][31] ([i915#3354] / [i915#3457])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-apl:          NOTRUN -> [INCOMPLETE][32] ([i915#2502] / [i915#3457])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][33] ([i915#2842] / [i915#3457]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][34] ([i915#3457]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][35] ([i915#2842] / [i915#3457]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][36] ([i915#2842] / [i915#3457])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#2842] / [i915#3457])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#2842] / [i915#3457])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#2842] / [i915#3457])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_schedule@preempt-hang@vcs0:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#3457]) +28 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk2/igt@gem_exec_schedule@preempt-hang@vcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html

  * igt@gem_exec_schedule@submit-early-slice@vecs0:
    - shard-glk:          NOTRUN -> [FAIL][45] ([i915#3457]) +50 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_exec_schedule@submit-early-slice@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          NOTRUN -> [DMESG-WARN][46] ([i915#118] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#2190])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][49] ([i915#3468]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
    - shard-kbl:          [PASS][50] -> [INCOMPLETE][51] ([i915#3468])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][52] ([i915#3468]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][53] ([i915#3468]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_offset@clear:
    - shard-glk:          NOTRUN -> [FAIL][54] ([i915#1888] / [i915#3160])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_mmap_offset@clear.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][55] ([i915#2658])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-apl:          NOTRUN -> [INCOMPLETE][56] ([i915#3468])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#768]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][58] ([i915#3468]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][59] ([i915#3468]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][60] ([i915#3457] / [i915#3468])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109312])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109312])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3323])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3297]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#3297]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_wait@await@bcs0:
    - shard-apl:          [PASS][66] -> [FAIL][67] ([i915#3457]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_wait@await@bcs0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_wait@await@bcs0.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109289]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109289]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271]) +171 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#112306]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#112306]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_hangman@error-state-capture@bcs0:
    - shard-snb:          NOTRUN -> [DMESG-WARN][73] ([i915#3457]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@i915_hangman@error-state-capture@bcs0.html

  * igt@i915_module_load@reload:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][74] ([i915#3457]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@i915_module_load@reload.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][75] ([i915#3457]) +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3288])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][77] ([i915#3343])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [PASS][78] -> [DMESG-WARN][79] ([i915#2411] / [i915#3457]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@i915_pm_rpm@cursor.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@i915_pm_rpm@cursor.html
    - shard-kbl:          [PASS][80] -> [DMESG-WARN][81] ([i915#3457])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl2/igt@i915_pm_rpm@cursor.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [PASS][82] -> [DMESG-WARN][83] ([i915#3457])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@i915_pm_rpm@cursor.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk2/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#110892]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][85] ([i915#3457]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@i915_pm_rps@reset.html

  * igt@kms_atomic@plane-immutable-zpos:
    - shard-glk:          [PASS][86] -> [FAIL][87] ([i915#2657] / [i915#3457])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_atomic@plane-immutable-zpos.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk8/igt@kms_atomic@plane-immutable-zpos.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#110725] / [fdo#111614]) +6 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#111614]) +6 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#111615]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#110723])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#2705])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb3/igt@kms_big_joiner@invalid-modeset.html
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2705])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2705])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_big_joiner@invalid-modeset.html
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2705])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2705])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][99] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [fdo#111827]) +30 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][101] ([i915#1149])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_color@pipe-b-degamma.html
    - shard-glk:          NOTRUN -> [FAIL][102] ([i915#71])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][103] ([i915#1149])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-c-degamma:
    - shard-glk:          [PASS][104] -> [FAIL][105] ([i915#71]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk6/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109278] / [i915#1149]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109284] / [fdo#111827]) +21 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109284] / [fdo#111827]) +19 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][110] ([i915#1319])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#3116])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#3116])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][113] ([i915#2105])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#111828])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109300] / [fdo#111066])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-snb:          NOTRUN -> [FAIL][116] ([i915#3457]) +4 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#3319] / [i915#3457]) +6 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][118] ([i915#3444] / [i915#3457]) +16 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-apl:          [PASS][119] -> [FAIL][120] ([i915#3444] / [i915#3457])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109278] / [fdo#109279] / [i915#3457]) +6 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-apl:          NOTRUN -> [FAIL][122] ([i915#3444] / [i915#3457]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-iclb:         NOTRUN -> [FAIL][123] ([i915#3457]) +13 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-glk:          NOTRUN -> [FAIL][124] ([i915#3444] / [i915#3457]) +11 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-glk:          [PASS][125] -> [FAIL][126] ([i915#3444] / [i915#3457]) +4 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][127] -> [FAIL][128] ([i915#3444] / [i915#3457])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-dpms:
    - shard-iclb:         [PASS][129] -> [FAIL][130] ([i915#3457]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html

  * igt@kms_cursor_crc@pi

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html

--===============2637805564949352941==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6087_full -&gt; IGTPW_5817_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5817_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5817_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5817_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gem_pxp@create-regular-context-1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb3/igt@gem_pxp@create-regular-context-1.html">SKIP</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_pxp@hw-rejects-pxp-context} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk6/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb6/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl1/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_pxp@protected-encrypted-src-copy-not-readible} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">FAIL</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb3/igt@i915_selftest@perf@request.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@i915_selftest@perf@request.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk6/igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes}:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6087_full and IGTPW_5817_full:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc-with-hdcp:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc-without-hdcp:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5817_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@api_intel_bb@blit-noreloc-purge-cache.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@api_intel_bb@blit-noreloc-purge-cache.html">DMESG-FAIL</a> ([i915#3457]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@offset-control:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@api_intel_bb@offset-control.html">DMESG-WARN</a> ([i915#3457]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@api_intel_bb@offset-control.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@gem_ctx_persistence@many-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_ctx_persistence@many-contexts.html">DMESG-WARN</a> ([i915#118] / [i915#3457] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3457]) +10 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_exec_endless@dispatch@vecs0.html">INCOMPLETE</a> ([i915#2502] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">INCOMPLETE</a> ([i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-hang@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk2/igt@gem_exec_schedule@preempt-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html">FAIL</a> ([i915#3457]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vecs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_exec_schedule@submit-early-slice@vecs0.html">FAIL</a> ([i915#3457]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_mmap_offset@clear.html">FAIL</a> ([i915#1888] / [i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3457] / [i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@await@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_wait@await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_wait@await@bcs0.html">FAIL</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +171 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-capture@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@i915_hangman@error-state-capture@bcs0.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#3457]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#3457]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@i915_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#2411] / [i915#3457]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl2/igt@i915_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@i915_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk2/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_atomic@plane-immutable-zpos.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk8/igt@kms_atomic@plane-immutable-zpos.html">FAIL</a> ([i915#2657] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +6 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk6/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html">FAIL</a> ([i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319] / [i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL</a> ([i915#3444] / [i915#3457]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#3444] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html">FAIL</a> ([i915#3444] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3457]) +13 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3444] / [i915#3457]) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457]) +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html">FAIL</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pi</p>
</li>
</ul>

</body>
</html>

--===============2637805564949352941==--

--===============0749243113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0749243113==--
