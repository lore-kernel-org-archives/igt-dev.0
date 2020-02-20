Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 17:43:16 -0000
Message-ID: <158222059683.17409.2528539645247801667@emeril.freedesktop.org>
References: <20200220165301.1996742-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220165301.1996742-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Feio=3A_Trim_kms_workload?=
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

Series: i915/gem_eio: Trim kms workload
URL   : https://patchwork.freedesktop.org/series/73723/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7973 -> IGTPW_4200
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4200 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4200, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4200:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gt_lrc:
    - fi-cfl-guc:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cfl-guc/igt@i915_selftest@live_gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-cfl-guc/igt@i915_selftest@live_gt_lrc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7973 and IGTPW_4200:

### New IGT tests (4) ###

  * igt@i915_pm_backlight@basic-brightness:
    - Statuses : 1 dmesg-warn(s) 16 pass(s) 21 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 dmesg-warn(s) 27 pass(s) 10 skip(s)
    - Exec time: [0.0, 4.97] s

  * igt@i915_pm_rpm@basic-rte:
    - Statuses : 1 dmesg-warn(s) 27 pass(s) 10 skip(s)
    - Exec time: [0.45, 17.95] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 33 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4200 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [PASS][5] -> [TIMEOUT][6] ([fdo#111732] / [fdo#112271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][7] -> [DMESG-WARN][8] ([i915#44])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  * igt@vgem_basic@debugfs:
    - fi-tgl-y:           [PASS][9] -> [DMESG-WARN][10] ([CI#94] / [i915#402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@vgem_basic@debugfs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-tgl-y/igt@vgem_basic@debugfs.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][11] ([i915#877]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][13] ([i915#217]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][17] ([i915#45]) -> [TIMEOUT][18] ([fdo#112271] / [i915#1084] / [i915#816])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u3:          [SKIP][19] ([fdo#109284] / [fdo#111827]) -> [SKIP][20] ([fdo#109284] / [fdo#111827] / [i915#585])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@kms_chamelium@dp-edid-read.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-icl-u3/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-icl-u3:          [SKIP][21] ([fdo#109284] / [fdo#111827] / [i915#585]) -> [SKIP][22] ([fdo#109284] / [fdo#111827])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@kms_chamelium@dp-hpd-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/fi-icl-u3/igt@kms_chamelium@dp-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (49 -> 42)
------------------------------

  Additional (3): fi-kbl-soraka fi-ivb-3770 fi-pnv-d510 
  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-ctg-p8600 fi-bsw-kefka fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4200

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4200: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4200/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
