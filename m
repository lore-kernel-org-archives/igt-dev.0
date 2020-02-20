Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 19:09:50 -0000
Message-ID: <158222579014.17406.4276101091476118134@emeril.freedesktop.org>
References: <20200220165721.2056191-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220165721.2056191-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc3dfc3lu?=
 =?utf-8?q?c=3A_Use_fixed_runtime_for_sync=5Fexpired=5Fmerge?=
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

Series: sw_sync: Use fixed runtime for sync_expired_merge
URL   : https://patchwork.freedesktop.org/series/73724/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7975 -> IGTPW_4201
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/index.html

Known issues
------------

  Here are the changes found in IGTPW_4201 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][3] -> [DMESG-WARN][4] ([i915#44])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770r:       [TIMEOUT][5] ([fdo#112271] / [i915#1084]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [INCOMPLETE][7] ([i915#45]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][9] ([fdo#108569]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-icl-y/igt@i915_selftest@live_execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][11] ([i915#262]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][13] ([CI#94] / [i915#402]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@i915_selftest@live_gt_lrc:
    - fi-tgl-y:           [DMESG-FAIL][15] ([CI#94] / [i915#1233]) -> [INCOMPLETE][16] ([CI#94] / [i915#1233])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@i915_selftest@live_gt_lrc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-tgl-y/igt@i915_selftest@live_gt_lrc.html

  * igt@runner@aborted:
    - fi-tgl-y:           [FAIL][17] ([CI#94] / [i915#529] / [i915#584]) -> [FAIL][18] ([CI#94] / [i915#584])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/fi-tgl-y/igt@runner@aborted.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#584]: https://gitlab.freedesktop.org/drm/intel/issues/584


Participating hosts (47 -> 44)
------------------------------

  Additional (4): fi-glk-dsi fi-bwr-2160 fi-snb-2520m fi-kbl-r 
  Missing    (7): fi-ilk-m540 fi-tgl-u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4201

  CI-20190529: 20190529
  CI_DRM_7975: f66891f7bdc3c60bb6f06fd6bc0718a0bd975896 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4201: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
