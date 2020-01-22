Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 23:50:43 -0000
Message-ID: <157973704331.22393.7059619587994097967@emeril.freedesktop.org>
References: <20200122231655.9702-1-juston.li@intel.com>
In-Reply-To: <20200122231655.9702-1-juston.li@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv5=2Ci-g-t=2C1/2=5D_include/drm-uapi=3A_Impor?=
 =?utf-8?q?t_headers_from_3ff4c24bdb1f?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juston Li <juston.li@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v5,i-g-t,1/2] include/drm-uapi: Import headers from 3ff4c24bdb1f
URL   : https://patchwork.freedesktop.org/series/72429/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7797 -> IGTPW_3972
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3972 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3972, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3972:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-tgl-y:           NOTRUN -> [SKIP][2] +29 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-tgl-y/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][3] ([fdo#112271]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_3972 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-bxt-dsi:         [PASS][5] -> [INCOMPLETE][6] ([fdo#103927])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
    - fi-cml-s:           [PASS][7] -> [INCOMPLETE][8] ([i915#283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-u2:          [PASS][9] -> [FAIL][10] ([fdo#109635] / [i915#262])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][11] ([i915#45]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_store@basic-all:
    - fi-byt-n2820:       [FAIL][13] ([i915#694]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-byt-n2820/igt@gem_exec_store@basic-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-byt-n2820/igt@gem_exec_store@basic-all.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-byt-n2820:       [TIMEOUT][15] ([fdo#112271] / [i915#895]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-byt-n2820/igt@gem_exec_suspend@basic-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-byt-n2820/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][19] ([i915#44]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7797/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#895]: https://gitlab.freedesktop.org/drm/intel/issues/895


Participating hosts (51 -> 45)
------------------------------

  Additional (2): fi-kbl-7560u fi-tgl-y 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-glk-dsi fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3972

  CI-20190529: 20190529
  CI_DRM_7797: c6751dc645f51c3058592c615770ecefd9899672 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3972: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_getfb@getfb2-accept-ccs
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3972/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
