Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 13:44:54 -0000
Message-ID: <158047829424.13123.12032646897314001443@emeril.freedesktop.org>
References: <20200131131234.23058-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200131131234.23058-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fmmap=5Foffset=3A_Exercise_mapping_to_userptr?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_mmap_offset: Exercise mapping to userptr
URL   : https://patchwork.freedesktop.org/series/72822/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5408 -> IGTPW_4059
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4059 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4059, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4059:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  * igt@runner@aborted:
    - fi-hsw-peppy:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-hsw-peppy/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4059 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][4] -> [INCOMPLETE][5] ([CI#94] / [i915#460] / [i915#472])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][6] -> [DMESG-FAIL][7] ([fdo#108569])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-y/igt@i915_selftest@live_execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][8] -> [INCOMPLETE][9] ([CI#80] / [fdo#106070] / [i915#424])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][10] -> [FAIL][11] ([fdo#111096] / [i915#323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][12] ([i915#553] / [i915#725]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][14] ([i915#563]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][16] ([i915#976]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][18] ([fdo#109635] / [i915#217]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][20] ([i915#553] / [i915#725]) -> [DMESG-FAIL][21] ([i915#725])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 47)
------------------------------

  Additional (5): fi-kbl-soraka fi-bsw-n3050 fi-hsw-peppy fi-elk-e7500 fi-bsw-kefka 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5408 -> IGTPW_4059

  CI-20190529: 20190529
  CI_DRM_7850: ae66f2257648ce52c51298506977baa32873c9d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4059: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/index.html
  IGT_5408: 8980bcd421744fb63d38270e1fcc9c7432d70d00 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_mmap_offset@userptr-gtt-mapping
+igt@gem_mmap_offset@userptr-uc-mapping
+igt@gem_mmap_offset@userptr-wb-mapping
+igt@gem_mmap_offset@userptr-wc-mapping

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4059/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
