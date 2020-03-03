Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Mar 2020 23:56:58 -0000
Message-ID: <158327981829.15379.18298389576972048963@emeril.freedesktop.org>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGln?=
 =?utf-8?q?t_tests_for_perf_OA_interrupts?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add igt tests for perf OA interrupts
URL   : https://patchwork.freedesktop.org/series/74229/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8059 -> IGTPW_4252
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/index.html

Known issues
------------

  Here are the changes found in IGTPW_4252 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-tgl-y/igt@kms_addfb_basic@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-tgl-y/igt@kms_addfb_basic@basic.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [PASS][3] -> [FAIL][4] ([fdo#109635] / [i915#217])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][5] ([CI#94]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_mmap@basic:
    - fi-tgl-y:           [DMESG-WARN][7] ([CI#94] / [i915#402]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-tgl-y/igt@gem_mmap@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-tgl-y/igt@gem_mmap@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [FAIL][9] ([i915#579]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][11] ([i915#877]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
    - fi-cfl-guc:         [INCOMPLETE][13] ([fdo#106070] / [i915#424]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (48 -> 46)
------------------------------

  Additional (2): fi-kbl-7560u fi-cfl-8109u 
  Missing    (4): fi-byt-clapper fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5489 -> IGTPW_4252

  CI-20190529: 20190529
  CI_DRM_8059: 1beee9fc089828e40507003ffeaeef0697345be7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4252: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/index.html
  IGT_5489: f74d9ecfb482388b05f6902b29e64c031989ad33 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@blocking-parameterized
+igt@perf@blocking-with-interrupt
+igt@perf@flush-data
+igt@perf@polling-parameterized
+igt@perf@polling-with-interrupt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
