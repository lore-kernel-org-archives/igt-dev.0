Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 16 May 2021 02:13:01 -0000
Message-ID: <162113118148.6785.6891648206904279053@emeril.freedesktop.org>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0776575935=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0776575935==
Content-Type: multipart/alternative;
 boundary="===============4303491255444928982=="

--===============4303491255444928982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev4)
URL   : https://patchwork.freedesktop.org/series/87570/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10087_full -> IGTPW_5814_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5814_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5814_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5814_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_pxp@create-regular-context-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_pxp@create-regular-context-1.html

  * {igt@gem_pxp@hw-rejects-pxp-buffer} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-snb:          NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * {igt@gem_pxp@hw-rejects-pxp-context} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][4] +7 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk9/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-apl:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-iclb:         NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-kbl:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl7/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-128:
    - shard-tglb:         NOTRUN -> [FAIL][8] +12 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html

  
#### Warnings ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-snb:          [INCOMPLETE][9] ([i915#3468]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
    - shard-glk:          [INCOMPLETE][11] ([i915#3468]) -> [INCOMPLETE][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-128:
    - shard-snb:          [FAIL][13] ([i915#3457]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-snb6/igt@kms_plane_cursor@pipe-b-overlay-size-128.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@kms_plane_cursor@pipe-b-overlay-size-128.html

  * igt@kms_plane_cursor@pipe-b-primary-size-64:
    - shard-tglb:         [FAIL][15] ([i915#3457]) -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb2/igt@kms_plane_cursor@pipe-b-primary-size-64.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb7/igt@kms_plane_cursor@pipe-b-primary-size-64.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-panning-top-left@pipe-b-planes}:
    - shard-glk:          NOTRUN -> [FAIL][17] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html

  * {igt@kms_plane@plane-position-covered@pipe-b-planes}:
    - shard-glk:          [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk9/igt@kms_plane@plane-position-covered@pipe-b-planes.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk6/igt@kms_plane@plane-position-covered@pipe-b-planes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10087_full and IGTPW_5814_full:

### New IGT tests (20) ###

  * igt@gem_pxp@create-protected-buffer:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_pxp@create-regular-buffer:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@create-regular-context-1:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@create-regular-context-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@create-valid-protected-context:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@display-protected-crc-with-hdcp:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@display-protected-crc-without-hdcp:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@fail-invalid-protected-context:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_pxp@hw-rejects-pxp-context:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@reject-modify-context-protection-on:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_5814_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][20] ([i915#3457]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl6/igt@api_intel_bb@blit-noreloc-keep-cache.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][21] ([i915#3457])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@api_intel_bb@blit-noreloc-purge-cache-random:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][22] ([i915#3457])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@api_intel_bb@blit-noreloc-purge-cache-random.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-snb:          NOTRUN -> [DMESG-WARN][23] ([i915#3457]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#1839])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#1839])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][26] ([i915#3457] / [i915#3468])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb3/igt@gem_ctx_engines@invalid-engines.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][27] ([i915#3468]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@engines-persistence@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][28] ([i915#3457]) +10 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_ctx_persistence@engines-persistence@bcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#3457]) +24 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk4/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1099]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#280]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][33] -> [TIMEOUT][34] ([i915#3063] / [i915#3457])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][35] ([i915#2369] / [i915#3063] / [i915#3457])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][36] ([i915#2502] / [i915#3457])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk8/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#2842] / [i915#3457])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][39] ([i915#2842] / [i915#3457])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][40] ([i915#2842] / [i915#3457]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@keep-in-fence@vecs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][41] ([i915#3457])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk4/igt@gem_exec_fence@keep-in-fence@vecs0.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-glk:          NOTRUN -> [FAIL][42] ([i915#3457]) +22 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109283])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([i915#2190])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111656])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109292])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#3468] / [i915#750])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][52] ([i915#3468]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_mmap_gtt@fault-concurrent.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][53] ([i915#3468])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][54] ([i915#2658])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271]) +208 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#768]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][57] ([i915#3457])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][58] ([i915#3457] / [i915#3468]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-apl:          NOTRUN -> [INCOMPLETE][59] ([i915#3468]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109312])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb3/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109312])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gem_softpin@evict-snoop.html

  * igt@gem_spin_batch@spin-each:
    - shard-apl:          NOTRUN -> [FAIL][62] ([i915#2898] / [i915#3457])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_spin_batch@spin-each.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3297]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3297]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][65] ([i915#3002])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][66] ([i915#2724] / [i915#3457])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_userptr_blits@vma-merge.html
    - shard-apl:          NOTRUN -> [FAIL][67] ([i915#3318] / [i915#3457])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][68] ([i915#3457])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb3/igt@gem_workarounds@suspend-resume.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][69] ([i915#180] / [i915#3457])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl4/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_render_tiledx_blits:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109289]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109289]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][72] ([i915#3296])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#112306]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#112306]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#1937])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#1937])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-apl:          NOTRUN -> [DMESG-WARN][78] ([i915#3457])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][79] ([i915#2411] / [i915#3457])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@gem-mmap-type@uc:
    - shard-glk:          [PASS][80] -> [DMESG-WARN][81] ([i915#3475])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@uc.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk6/igt@i915_pm_rpm@gem-mmap-type@uc.html

  * igt@i915_pm_rpm@gem-mmap-type@wc:
    - shard-glk:          [PASS][82] -> [DMESG-WARN][83] ([i915#3457])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@wc.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk6/igt@i915_pm_rpm@gem-mmap-type@wc.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271]) +175 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][85] ([i915#3457]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109302])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109302])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb2/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][88] ([i915#3462])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_selftest@live@execlists.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][89] ([i915#3462])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk8/igt@i915_selftest@live@execlists.html
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][90] ([i915#3462])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@i915_selftest@live@execlists.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][91] ([i915#2782] / [i915#3462] / [i915#794])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl6/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][92] ([i915#2373])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][93] ([i915#1759] / [i915#2291])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][94] ([i915#2782])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - shard-glk:          NOTRUN -> [DMESG-WARN][95] ([i915#3457]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk8/igt@i915_selftest@live@mman.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][96] ([i915#3457]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][97] ([i915#180]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#404])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#111614]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#110723]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#111615]) +6 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2705])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2705]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl2/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#2705])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> [SKIP][106] ([fdo#109271]) +471 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
    - shard-glk:          [PASS][107] -> [FAIL][108] ([fdo#108145])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk9/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@kms_chamelium@vga-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#109284] / [fdo#111827]) +21 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-b-gamma:
    - shard-glk:          NOTRUN -> [FAIL][112] ([i915#71]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@kms_color@pipe-b-gamma.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109278] / [i915#1149])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109284] / [fdo#111827]) +20 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][117] ([fdo#109271] / [fdo#111827]) +33 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][118] ([i915#1319])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl3/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#109300] / [fdo#111066])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_content_protection@atomic.html
    - shard-apl:          NOTRUN -> [TIMEOUT][120] ([i915#1319]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#3116])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#111828]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          NOTRUN -> [FAIL][123] ([i915#3457]) +11 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-snb:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#3457]) +73 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-iclb:         [PASS][125] -> [FAIL][126] ([i915#3457]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.ht

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html

--===============4303491255444928982==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10087_full -&gt; IGTPW_5814_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5814_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5814_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5814_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_pxp@create-regular-context-1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_pxp@create-regular-context-1.html">SKIP</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_pxp@hw-rejects-pxp-buffer} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@gem_pxp@hw-rejects-pxp-buffer.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_pxp@hw-rejects-pxp-context} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk9/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl7/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-viewport-size-128:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html">FAIL</a> +12 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-128:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-snb6/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-64:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb2/igt@kms_plane_cursor@pipe-b-primary-size-64.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb7/igt@kms_plane_cursor@pipe-b-primary-size-64.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_plane@plane-panning-top-left@pipe-b-planes}:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-b-planes}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk9/igt@kms_plane@plane-position-covered@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk6/igt@kms_plane@plane-position-covered@pipe-b-planes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10087_full and IGTPW_5814_full:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc-with-hdcp:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc-without-hdcp:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5814_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl6/igt@api_intel_bb@blit-noreloc-keep-cache.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@api_intel_bb@blit-noreloc-keep-cache.html">DMESG-FAIL</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@api_intel_bb@blit-noreloc-purge-cache-random.html">DMESG-FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@api_intel_bb@blit-reloc-purge-cache.html">DMESG-WARN</a> ([i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb3/igt@gem_ctx_engines@invalid-engines.html">INCOMPLETE</a> ([i915#3457] / [i915#3468])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@gem_ctx_engines@invalid-engines.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_ctx_persistence@engines-persistence@bcs0.html">FAIL</a> ([i915#3457]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk4/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html">FAIL</a> ([i915#3457]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk8/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> ([i915#2502] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@keep-in-fence@vecs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk4/igt@gem_exec_fence@keep-in-fence@vecs0.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@gem_exec_fence@parallel@vcs0.html">FAIL</a> ([i915#3457]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-tglb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468] / [i915#750])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@gem_mmap_gtt@fault-concurrent.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@gem_mmap_gtt@fault-concurrent.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +208 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">INCOMPLETE</a> ([i915#3457] / [i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb3/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-each:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@gem_spin_batch@spin-each.html">FAIL</a> ([i915#2898] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724] / [i915#3457])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb3/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#3457])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl4/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([fdo#112306]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([fdo#112306]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@i915_pm_rc6_residency@rc6-fence.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_pm_rpm@cursor.html">DMESG-WARN</a> ([i915#2411] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk6/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#3475])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk8/igt@i915_pm_rpm@gem-mmap-type@wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk6/igt@i915_pm_rpm@gem-mmap-type@wc.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +175 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@i915_pm_rps@min-max-config-idle.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb2/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#3462])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk8/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl6/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#2782] / [i915#3462] / [i915#794])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk8/igt@i915_selftest@live@mman.html">DMESG-WARN</a> ([i915#3457]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@i915_selftest@live@mman.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl2/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl2/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +471 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-glk9/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html">FAIL</a> ([fdo#108145])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +21 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@kms_color@pipe-b-gamma.html">FAIL</a> ([i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-glk5/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-kbl3/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-iclb8/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-apl7/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-tglb3/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3457]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">SKIP</a> ([fdo#109271] / [i915#3457]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.ht">PASS</a> -&gt; [FAIL][126] ([i915#3457]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4303491255444928982==--

--===============0776575935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0776575935==--
