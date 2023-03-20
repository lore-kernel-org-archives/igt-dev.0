Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7895059416976521652=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Mon, 20 Mar 2023 13:08:06 -0000
Message-ID: <167931768607.26306.16948882815266967335@emeril.freedesktop.org>
References: <20230309141940.714569-1-vikas.srivastava@intel.com>
In-Reply-To: <20230309141940.714569-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_skip_gem=5Fset=5Fcaching_call_for_mtl_=28rev3=29?=
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

--===============7895059416976521652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915: skip gem_set_caching call for mtl (rev3)
URL   : https://patchwork.freedesktop.org/series/114544/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12883 -> IGTPW_8642
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html

Participating hosts (34 -> 36)
------------------------------

  Additional (2): fi-kbl-soraka bat-atsm-1 

Known issues
------------

  Here are the changes found in IGTPW_8642 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-atsm-1:         NOTRUN -> [SKIP][1] ([i915#2582]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@fbdev@eof.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][5] ([i915#4077]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#4079]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-atsm-1:         NOTRUN -> [SKIP][7] ([i915#6621])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][8] ([i915#5334] / [i915#7872])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#1886])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-atsm-1:         NOTRUN -> [SKIP][10] ([i915#6645])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         NOTRUN -> [SKIP][11] ([i915#6077]) +36 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][12] ([fdo#109271]) +16 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-1:         NOTRUN -> [SKIP][13] ([i915#7828])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         NOTRUN -> [SKIP][14] ([i915#6078]) +19 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-plain-flip:
    - bat-atsm-1:         NOTRUN -> [SKIP][15] ([i915#6166]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-atsm-1:         NOTRUN -> [SKIP][16] ([i915#6093]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-atsm-1:         NOTRUN -> [SKIP][17] ([i915#1836]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][18] ([i915#3546])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-1:         NOTRUN -> [SKIP][19] ([i915#1845])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][20] ([i915#7357])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         NOTRUN -> [SKIP][21] ([i915#1072]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-atsm-1:         NOTRUN -> [SKIP][22] ([i915#6094])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-atsm-1:         NOTRUN -> [SKIP][23] ([fdo#109295] / [i915#6078])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-atsm-1:         NOTRUN -> [SKIP][24] ([fdo#109295] / [i915#4077]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         NOTRUN -> [SKIP][25] ([fdo#109295]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][26] ([i915#4983]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-rpls-1/igt@i915_selftest@live@reset.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-rpls-1/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@prime_vgem@basic-userptr:
    - bat-jsl-3:          [SKIP][28] ([fdo#109295] / [i915#3301]) -> [SKIP][29] ([fdo#109295])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-jsl-3/igt@prime_vgem@basic-userptr.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-jsl-3/igt@prime_vgem@basic-userptr.html
    - bat-dg2-9:          [SKIP][30] ([i915#3708] / [i915#4873]) -> [SKIP][31] ([i915#3708])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg2-9/igt@prime_vgem@basic-userptr.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg2-9/igt@prime_vgem@basic-userptr.html
    - bat-adln-1:         [SKIP][32] ([fdo#109295] / [i915#3301]) -> [SKIP][33] ([fdo#109295])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-adln-1/igt@prime_vgem@basic-userptr.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adln-1/igt@prime_vgem@basic-userptr.html
    - bat-dg2-8:          [SKIP][34] ([i915#3708] / [i915#4873]) -> [SKIP][35] ([i915#3708])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg2-8/igt@prime_vgem@basic-userptr.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg2-8/igt@prime_vgem@basic-userptr.html
    - bat-jsl-1:          [SKIP][36] ([fdo#109295] / [i915#3301]) -> [SKIP][37] ([fdo#109295])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-jsl-1/igt@prime_vgem@basic-userptr.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-jsl-1/igt@prime_vgem@basic-userptr.html
    - fi-tgl-1115g4:      [SKIP][38] ([fdo#109295] / [i915#3301]) -> [SKIP][39] ([fdo#109295])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html
    - bat-dg1-5:          [SKIP][40] ([i915#3708] / [i915#4873]) -> [SKIP][41] ([i915#3708])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg1-5/igt@prime_vgem@basic-userptr.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg1-5/igt@prime_vgem@basic-userptr.html
    - bat-dg1-7:          [SKIP][42] ([i915#3708] / [i915#4873]) -> [SKIP][43] ([i915#3708])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg1-7/igt@prime_vgem@basic-userptr.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg1-7/igt@prime_vgem@basic-userptr.html
    - bat-adlp-9:         [SKIP][44] ([fdo#109295] / [i915#3301] / [i915#3708]) -> [SKIP][45] ([fdo#109295] / [i915#3708])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-adlp-9/igt@prime_vgem@basic-userptr.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adlp-9/igt@prime_vgem@basic-userptr.html
    - bat-dg2-11:         [SKIP][46] ([i915#3708] / [i915#4873]) -> [SKIP][47] ([i915#3708])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg2-11/igt@prime_vgem@basic-userptr.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg2-11/igt@prime_vgem@basic-userptr.html
    - bat-dg1-6:          [SKIP][48] ([i915#3708] / [i915#4873]) -> [SKIP][49] ([i915#3708])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg1-6/igt@prime_vgem@basic-userptr.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg1-6/igt@prime_vgem@basic-userptr.html
    - fi-rkl-11600:       [SKIP][50] ([fdo#109295] / [i915#3301] / [i915#3708]) -> [SKIP][51] ([fdo#109295] / [i915#3708])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/fi-rkl-11600/igt@prime_vgem@basic-userptr.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-rkl-11600/igt@prime_vgem@basic-userptr.html
    - bat-adls-5:         [SKIP][52] ([fdo#109295] / [i915#3301]) -> [SKIP][53] ([fdo#109295])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-adls-5/igt@prime_vgem@basic-userptr.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adls-5/igt@prime_vgem@basic-userptr.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7207 -> IGTPW_8642

  CI-20190529: 20190529
  CI_DRM_12883: 5619fa2b4a9b93019f6ca27a2f391fc39e152993 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8642: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html
  IGT_7207: 51001c91c367464da9e700e617fb712b3b1cecfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_userptr_blits@access-control
-igt@gem_userptr_blits@coherency-sync
-igt@gem_userptr_blits@coherency-unsync
-igt@gem_userptr_blits@create-destroy-sync
-igt@gem_userptr_blits@create-destroy-unsync
-igt@gem_userptr_blits@dmabuf-sync
-igt@gem_userptr_blits@dmabuf-unsync
-igt@gem_userptr_blits@forbidden-operations
-igt@gem_userptr_blits@forked-access
-igt@gem_userptr_blits@forked-sync-interruptible
-igt@gem_userptr_blits@forked-sync-mempressure-interruptible
-igt@gem_userptr_blits@forked-sync-mempressure-normal
-igt@gem_userptr_blits@forked-sync-multifd-interruptible
-igt@gem_userptr_blits@forked-sync-multifd-mempressure-interruptible
-igt@gem_userptr_blits@forked-sync-multifd-mempressure-normal
-igt@gem_userptr_blits@forked-sync-multifd-normal
-igt@gem_userptr_blits@forked-sync-normal
-igt@gem_userptr_blits@forked-sync-swapping-interruptible
-igt@gem_userptr_blits@forked-sync-swapping-mempressure-interruptible
-igt@gem_userptr_blits@forked-sync-swapping-mempressure-normal
-igt@gem_userptr_blits@forked-sync-swapping-multifd-interruptible
-igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-interruptible
-igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-normal
-igt@gem_userptr_blits@forked-sync-swapping-multifd-normal
-igt@gem_userptr_blits@forked-sync-swapping-normal
-igt@gem_userptr_blits@forked-unsync-interruptible
-igt@gem_userptr_blits@forked-unsync-mempressure-interruptible
-igt@gem_userptr_blits@forked-unsync-mempressure-normal
-igt@gem_userptr_blits@forked-unsync-multifd-interruptible
-igt@gem_userptr_blits@forked-unsync-multifd-mempressure-interruptible
-igt@gem_userptr_blits@forked-unsync-multifd-mempressure-normal
-igt@gem_userptr_blits@forked-unsync-multifd-normal
-igt@gem_userptr_blits@forked-unsync-normal
-igt@gem_userptr_blits@forked-unsync-swapping-interruptible
-igt@gem_userptr_blits@forked-unsync-swapping-mempressure-interruptible
-igt@gem_userptr_blits@forked-unsync-swapping-mempressure-normal
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-interruptible
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-interruptible
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-normal
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-normal
-igt@gem_userptr_blits@forked-unsync-swapping-normal
-igt@gem_userptr_blits@huge-split
-igt@gem_userptr_blits@input-checking
-igt@gem_userptr_blits@invalid-mmap-offset-unsync
-igt@gem_userptr_blits@invalid-null-pointer
-igt@gem_userptr_blits@major-normal-sync
-igt@gem_userptr_blits@major-sync-interruptible
-igt@gem_userptr_blits@major-unsync-interruptible
-igt@gem_userptr_blits@major-unsync-normal
-igt@gem_userptr_blits@map-fixed-invalidate
-igt@gem_userptr_blits@map-fixed-invalidate-busy
-igt@gem_userptr_blits@map-fixed-invalidate-overlap
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy
-igt@gem_userptr_blits@minor-normal-sync
-igt@gem_userptr_blits@minor-sync-interruptible
-igt@gem_userptr_blits@minor-unsync-interruptible
-igt@gem_userptr_blits@minor-unsync-normal
-igt@gem_userptr_blits@mlocked-normal-sync
-igt@gem_userptr_blits@mlocked-sync-interruptible
-igt@gem_userptr_blits@mlocked-unsync-interruptible
-igt@gem_userptr_blits@mlocked-unsync-normal
-igt@gem_userptr_blits@mmap-offset-banned
-igt@gem_userptr_blits@nohangcheck
-igt@gem_userptr_blits@probe
-igt@gem_userptr_blits@process-exit
-igt@gem_userptr_blits@process-exit-busy
-igt@gem_userptr_blits@readonly-pwrite-unsync
-igt@gem_userptr_blits@readonly-unsync
-igt@gem_userptr_blits@relocations
-igt@gem_userptr_blits@sd-probe
-igt@gem_userptr_blits@set-cache-level
-igt@gem_userptr_blits@stress-mm
-igt@gem_userptr_blits@stress-mm-invalidate-close
-igt@gem_userptr_blits@stress-mm-invalidate-close-overlap
-igt@gem_userptr_blits@stress-purge
-igt@gem_userptr_blits@swapping-normal-sync
-igt@gem_userptr_blits@swapping-sync-interruptible
-igt@gem_userptr_blits@swapping-unsync-interruptible
-igt@gem_userptr_blits@swapping-unsync-normal
-igt@gem_userptr_blits@sync-overlap
-igt@gem_userptr_blits@sync-unmap
-igt@gem_userptr_blits@sync-unmap-after-close
-igt@gem_userptr_blits@sync-unmap-cycles
-igt@gem_userptr_blits@unsync-overlap
-igt@gem_userptr_blits@unsync-unmap
-igt@gem_userptr_blits@unsync-unmap-after-close
-igt@gem_userptr_blits@unsync-unmap-cycles
-igt@gem_userptr_blits@usage-restrictions
-igt@gem_userptr_blits@userfault
-igt@gem_userptr_blits@vma-merge

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html

--===============7895059416976521652==
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
<tr><td><b>Series:</b></td><td>tests/i915: skip gem_set_caching call for mtl (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114544/">https://patchwork.freedesktop.org/series/114544/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12883 -&gt; IGTPW_8642</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html</p>
<h2>Participating hosts (34 -&gt; 36)</h2>
<p>Additional (2): fi-kbl-soraka bat-atsm-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8642 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6166">i915#6166</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6093">i915#6093</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6094">i915#6094</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-jsl-3/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-jsl-3/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg2-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg2-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-adln-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adln-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg2-8/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg2-8/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-jsl-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-jsl-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg1-7/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg1-7/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-adlp-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adlp-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg2-11/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg2-11/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-dg1-6/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-dg1-6/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12883/bat-adls-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/bat-adls-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7207 -&gt; IGTPW_8642</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12883: 5619fa2b4a9b93019f6ca27a2f391fc39e152993 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8642: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8642/index.html<br />
  IGT_7207: 51001c91c367464da9e700e617fb712b3b1cecfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_userptr_blits@access-control<br />
-igt@gem_userptr_blits@coherency-sync<br />
-igt@gem_userptr_blits@coherency-unsync<br />
-igt@gem_userptr_blits@create-destroy-sync<br />
-igt@gem_userptr_blits@create-destroy-unsync<br />
-igt@gem_userptr_blits@dmabuf-sync<br />
-igt@gem_userptr_blits@dmabuf-unsync<br />
-igt@gem_userptr_blits@forbidden-operations<br />
-igt@gem_userptr_blits@forked-access<br />
-igt@gem_userptr_blits@forked-sync-interruptible<br />
-igt@gem_userptr_blits@forked-sync-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-sync-mempressure-normal<br />
-igt@gem_userptr_blits@forked-sync-multifd-interruptible<br />
-igt@gem_userptr_blits@forked-sync-multifd-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-sync-multifd-mempressure-normal<br />
-igt@gem_userptr_blits@forked-sync-multifd-normal<br />
-igt@gem_userptr_blits@forked-sync-normal<br />
-igt@gem_userptr_blits@forked-sync-swapping-interruptible<br />
-igt@gem_userptr_blits@forked-sync-swapping-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-sync-swapping-mempressure-normal<br />
-igt@gem_userptr_blits@forked-sync-swapping-multifd-interruptible<br />
-igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-normal<br />
-igt@gem_userptr_blits@forked-sync-swapping-multifd-normal<br />
-igt@gem_userptr_blits@forked-sync-swapping-normal<br />
-igt@gem_userptr_blits@forked-unsync-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-mempressure-normal<br />
-igt@gem_userptr_blits@forked-unsync-multifd-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-multifd-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-multifd-mempressure-normal<br />
-igt@gem_userptr_blits@forked-unsync-multifd-normal<br />
-igt@gem_userptr_blits@forked-unsync-normal<br />
-igt@gem_userptr_blits@forked-unsync-swapping-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-swapping-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-swapping-mempressure-normal<br />
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-interruptible<br />
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-normal<br />
-igt@gem_userptr_blits@forked-unsync-swapping-multifd-normal<br />
-igt@gem_userptr_blits@forked-unsync-swapping-normal<br />
-igt@gem_userptr_blits@huge-split<br />
-igt@gem_userptr_blits@input-checking<br />
-igt@gem_userptr_blits@invalid-mmap-offset-unsync<br />
-igt@gem_userptr_blits@invalid-null-pointer<br />
-igt@gem_userptr_blits@major-normal-sync<br />
-igt@gem_userptr_blits@major-sync-interruptible<br />
-igt@gem_userptr_blits@major-unsync-interruptible<br />
-igt@gem_userptr_blits@major-unsync-normal<br />
-igt@gem_userptr_blits@map-fixed-invalidate<br />
-igt@gem_userptr_blits@map-fixed-invalidate-busy<br />
-igt@gem_userptr_blits@map-fixed-invalidate-overlap<br />
-igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy<br />
-igt@gem_userptr_blits@minor-normal-sync<br />
-igt@gem_userptr_blits@minor-sync-interruptible<br />
-igt@gem_userptr_blits@minor-unsync-interruptible<br />
-igt@gem_userptr_blits@minor-unsync-normal<br />
-igt@gem_userptr_blits@mlocked-normal-sync<br />
-igt@gem_userptr_blits@mlocked-sync-interruptible<br />
-igt@gem_userptr_blits@mlocked-unsync-interruptible<br />
-igt@gem_userptr_blits@mlocked-unsync-normal<br />
-igt@gem_userptr_blits@mmap-offset-banned<br />
-igt@gem_userptr_blits@nohangcheck<br />
-igt@gem_userptr_blits@probe<br />
-igt@gem_userptr_blits@process-exit<br />
-igt@gem_userptr_blits@process-exit-busy<br />
-igt@gem_userptr_blits@readonly-pwrite-unsync<br />
-igt@gem_userptr_blits@readonly-unsync<br />
-igt@gem_userptr_blits@relocations<br />
-igt@gem_userptr_blits@sd-probe<br />
-igt@gem_userptr_blits@set-cache-level<br />
-igt@gem_userptr_blits@stress-mm<br />
-igt@gem_userptr_blits@stress-mm-invalidate-close<br />
-igt@gem_userptr_blits@stress-mm-invalidate-close-overlap<br />
-igt@gem_userptr_blits@stress-purge<br />
-igt@gem_userptr_blits@swapping-normal-sync<br />
-igt@gem_userptr_blits@swapping-sync-interruptible<br />
-igt@gem_userptr_blits@swapping-unsync-interruptible<br />
-igt@gem_userptr_blits@swapping-unsync-normal<br />
-igt@gem_userptr_blits@sync-overlap<br />
-igt@gem_userptr_blits@sync-unmap<br />
-igt@gem_userptr_blits@sync-unmap-after-close<br />
-igt@gem_userptr_blits@sync-unmap-cycles<br />
-igt@gem_userptr_blits@unsync-overlap<br />
-igt@gem_userptr_blits@unsync-unmap<br />
-igt@gem_userptr_blits@unsync-unmap-after-close<br />
-igt@gem_userptr_blits@unsync-unmap-cycles<br />
-igt@gem_userptr_blits@usage-restrictions<br />
-igt@gem_userptr_blits@userfault<br />
-igt@gem_userptr_blits@vma-merge</p>

</body>
</html>

--===============7895059416976521652==--
