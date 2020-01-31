Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 17:31:08 -0000
Message-ID: <158049186804.13121.9833776012183051045@emeril.freedesktop.org>
References: <20200131160201.3257166-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200131160201.3257166-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?ind_the_associated_runtime-pm_sysfs_for_the_device_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Find the associated runtime-pm sysfs for the device (rev2)
URL   : https://patchwork.freedesktop.org/series/72814/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5409 -> IGTPW_4062
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4062 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4062, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4062:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_hangcheck:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-bdw-5557u/igt@i915_selftest@live_hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-bdw-5557u/igt@i915_selftest@live_hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_4062 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][3] -> [TIMEOUT][4] ([fdo#112271] / [i915#1084])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][5] -> [TIMEOUT][6] ([fdo#112271] / [i915#816])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-skl-6770hq:      [PASS][7] -> [INCOMPLETE][8] ([i915#151])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-skl-6770hq/igt@i915_pm_rpm@basic-rte.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-skl-6770hq/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][9] -> [DMESG-FAIL][10] ([fdo#108569])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-icl-y/igt@i915_selftest@live_execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [PASS][11] -> [TIMEOUT][12] ([fdo#112271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][13] ([fdo#112271] / [i915#1084] / [i915#816]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-u2:          [FAIL][15] ([fdo#109635] / [i915#262]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][17] ([fdo#111096] / [i915#323]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][19] ([i915#553] / [i915#725]) -> [DMESG-FAIL][20] ([i915#725])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@runner@aborted:
    - fi-byt-n2820:       [FAIL][21] ([i915#999]) -> [FAIL][22] ([i915#816])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5409/fi-byt-n2820/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/fi-byt-n2820/igt@runner@aborted.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-bsw-kefka 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5409 -> IGTPW_4062

  CI-20190529: 20190529
  CI_DRM_7852: 6e9fa439565c60d77368ead38b0ec9e0653b92b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4062: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/index.html
  IGT_5409: 93aefe6baa3fabf8c0cabe83e185f7b8f8d8753d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4062/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
