Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 08:09:21 -0000
Message-ID: <158391416169.13950.14368115644694791766@emeril.freedesktop.org>
References: <20200310170928.109826-1-don.hiatt@intel.com>
In-Reply-To: <20200310170928.109826-1-don.hiatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fpm=3A_Adjust_pm_status_check_timeout_and_log_timing_=28rev2?=
 =?utf-8?q?=29?=
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
To: "Hiatt, Don" <don.hiatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_pm: Adjust pm status check timeout and log timing (rev2)
URL   : https://patchwork.freedesktop.org/series/74398/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8108 -> IGTPW_4287
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/index.html

Known issues
------------

  Here are the changes found in IGTPW_4287 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][1] -> [FAIL][2] ([CI#94])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [PASS][5] -> [DMESG-WARN][6] ([i915#92])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-skl-6770hq/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [PASS][7] -> [SKIP][8] ([fdo#109271]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [PASS][9] -> [DMESG-WARN][10] ([i915#106])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - fi-tgl-y:           [DMESG-WARN][11] ([CI#94] / [i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][13] ([i915#178]) -> [DMESG-WARN][14] ([i915#92])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8108/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (50 -> 43)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4287

  CI-20190529: 20190529
  CI_DRM_8108: 7616c3ce8d78b3c229e4dc27d795246a2677f0a9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4287: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
