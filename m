Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8428386358452462070=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Thu, 09 Mar 2023 15:26:04 -0000
Message-ID: <167837556413.12423.8387804352240243218@emeril.freedesktop.org>
References: <20230309141940.714569-1-vikas.srivastava@intel.com>
In-Reply-To: <20230309141940.714569-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_skip_gem=5Fset=5Fcaching_call_for_mtl_=28rev2=29?=
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

--===============8428386358452462070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915: skip gem_set_caching call for mtl (rev2)
URL   : https://patchwork.freedesktop.org/series/114544/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12831 -> IGTPW_8583
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8583 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-FAIL][2] ([i915#8141])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-cfl-8109u:       [PASS][3] -> [ABORT][4] ([i915#8141])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-WARN][7] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][8] -> [ABORT][9] ([i915#7911])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][10] ([i915#7913])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][11] ([i915#1886])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         NOTRUN -> [ABORT][12] ([i915#4983] / [i915#7913] / [i915#7981])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-rpls-2/igt@i915_selftest@live@reset.html
    - bat-rpls-1:         [PASS][13] -> [ABORT][14] ([i915#4983])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-1/igt@i915_selftest@live@reset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][15] ([fdo#109271]) +16 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-glk-j4005:       NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-bsw-nick/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][18] ([i915#7911] / [i915#7913]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-glk-j4005:       [ABORT][20] ([i915#6217]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [ABORT][22] ([i915#7694] / [i915#7913]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-2/igt@i915_selftest@live@requests.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-rpls-2/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@prime_vgem@basic-userptr:
    - bat-jsl-3:          [SKIP][24] ([fdo#109295] / [i915#3301]) -> [SKIP][25] ([fdo#109295])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-jsl-3/igt@prime_vgem@basic-userptr.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-jsl-3/igt@prime_vgem@basic-userptr.html
    - bat-dg2-9:          [SKIP][26] ([i915#3708] / [i915#4873]) -> [SKIP][27] ([i915#3708])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg2-9/igt@prime_vgem@basic-userptr.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg2-9/igt@prime_vgem@basic-userptr.html
    - bat-adln-1:         [SKIP][28] ([fdo#109295] / [i915#3301]) -> [SKIP][29] ([fdo#109295])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-adln-1/igt@prime_vgem@basic-userptr.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-adln-1/igt@prime_vgem@basic-userptr.html
    - bat-dg2-8:          [SKIP][30] ([i915#3708] / [i915#4873]) -> [SKIP][31] ([i915#3708])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg2-8/igt@prime_vgem@basic-userptr.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg2-8/igt@prime_vgem@basic-userptr.html
    - bat-jsl-1:          [SKIP][32] ([fdo#109295] / [i915#3301]) -> [SKIP][33] ([fdo#109295])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-jsl-1/igt@prime_vgem@basic-userptr.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-jsl-1/igt@prime_vgem@basic-userptr.html
    - fi-tgl-1115g4:      [SKIP][34] ([fdo#109295] / [i915#3301]) -> [SKIP][35] ([fdo#109295])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html
    - bat-dg1-5:          [SKIP][36] ([i915#3708] / [i915#4873]) -> [SKIP][37] ([i915#3708])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg1-5/igt@prime_vgem@basic-userptr.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg1-5/igt@prime_vgem@basic-userptr.html
    - bat-dg1-7:          [SKIP][38] ([i915#3708] / [i915#4873]) -> [SKIP][39] ([i915#3708])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg1-7/igt@prime_vgem@basic-userptr.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg1-7/igt@prime_vgem@basic-userptr.html
    - bat-adlp-9:         [SKIP][40] ([fdo#109295] / [i915#3301] / [i915#3708]) -> [SKIP][41] ([fdo#109295] / [i915#3708])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-adlp-9/igt@prime_vgem@basic-userptr.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-adlp-9/igt@prime_vgem@basic-userptr.html
    - bat-dg2-11:         [SKIP][42] ([i915#3708] / [i915#4873]) -> [SKIP][43] ([i915#3708])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg2-11/igt@prime_vgem@basic-userptr.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg2-11/igt@prime_vgem@basic-userptr.html
    - bat-dg1-6:          [SKIP][44] ([i915#3708] / [i915#4873]) -> [SKIP][45] ([i915#3708])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg1-6/igt@prime_vgem@basic-userptr.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg1-6/igt@prime_vgem@basic-userptr.html
    - fi-rkl-11600:       [SKIP][46] ([fdo#109295] / [i915#3301] / [i915#3708]) -> [SKIP][47] ([fdo#109295] / [i915#3708])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-rkl-11600/igt@prime_vgem@basic-userptr.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-rkl-11600/igt@prime_vgem@basic-userptr.html
    - bat-adls-5:         [SKIP][48] ([fdo#109295] / [i915#3301]) -> [SKIP][49] ([fdo#109295])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-adls-5/igt@prime_vgem@basic-userptr.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-adls-5/igt@prime_vgem@basic-userptr.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6217]: https://gitlab.freedesktop.org/drm/intel/issues/6217
  [i915#7694]: https://gitlab.freedesktop.org/drm/intel/issues/7694
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8141]: https://gitlab.freedesktop.org/drm/intel/issues/8141


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7188 -> IGTPW_8583

  CI-20190529: 20190529
  CI_DRM_12831: 4910ebea52abc05f63bfc43bc91baebd8af93d45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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
-igt@vgem_basic@bad-fence
-igt@vgem_basic@bad-flag
-igt@vgem_basic@bad-handle
-igt@vgem_basic@bad-pad
-igt@vgem_basic@busy-fence

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html

--===============8428386358452462070==
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
<tr><td><b>Series:</b></td><td>tests/i915: skip gem_set_caching call for mtl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114544/">https://patchwork.freedesktop.org/series/114544/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12831 -&gt; IGTPW_8583</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8583 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8141">i915#8141</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8141">i915#8141</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-bsw-nick/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6217">i915#6217</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7694">i915#7694</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-jsl-3/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-jsl-3/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg2-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg2-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-adln-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-adln-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg2-8/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg2-8/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-jsl-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-jsl-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg1-7/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg1-7/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-adlp-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-adlp-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg2-11/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg2-11/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-dg1-6/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-dg1-6/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-adls-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/bat-adls-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7188 -&gt; IGTPW_8583</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12831: 4910ebea52abc05f63bfc43bc91baebd8af93d45 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html<br />
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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
-igt@gem_userptr_blits@vma-merge<br />
-igt@vgem_basic@bad-fence<br />
-igt@vgem_basic@bad-flag<br />
-igt@vgem_basic@bad-handle<br />
-igt@vgem_basic@bad-pad<br />
-igt@vgem_basic@busy-fence</p>

</body>
</html>

--===============8428386358452462070==--
