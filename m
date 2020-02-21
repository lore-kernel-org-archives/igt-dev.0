Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 15:04:16 -0000
Message-ID: <158229745689.7919.4648671204447758023@emeril.freedesktop.org>
References: <20200221134134.1275235-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200221134134.1275235-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_reuse_the_new_i915-perf_library?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: reuse the new i915-perf library
URL   : https://patchwork.freedesktop.org/series/73770/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7982 -> IGTPW_4210
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4210 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4210, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4210:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_vma:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-bwr-2160/igt@i915_selftest@live_vma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/fi-bwr-2160/igt@i915_selftest@live_vma.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7982 and IGTPW_4210:

### New IGT tests (1) ###

  * igt@i915_pm_rpm@module-reload:
    - Statuses : 2 dmesg-warn(s) 27 pass(s) 8 skip(s)
    - Exec time: [0.0, 48.79] s

  

Known issues
------------

  Here are the changes found in IGTPW_4210 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_gtt:
    - fi-icl-dsi:         [PASS][3] -> [TIMEOUT][4] ([fdo#112271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-icl-dsi/igt@i915_selftest@live_gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/fi-icl-dsi/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-skl-guc:         [PASS][5] -> [INCOMPLETE][6] ([fdo#108744])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-skl-guc/igt@i915_selftest@live_hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/fi-skl-guc/igt@i915_selftest@live_hangcheck.html

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([CI#94] / [i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [INCOMPLETE][9] ([i915#146] / [i915#69]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - fi-tgl-y:           [DMESG-WARN][11] ([CI#94] / [i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108744]: https://bugs.freedesktop.org/show_bug.cgi?id=108744
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69


Participating hosts (51 -> 42)
------------------------------

  Additional (2): fi-hsw-peppy fi-snb-2520m 
  Missing    (11): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-kbl-guc fi-ctg-p8600 fi-kbl-8809g fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4210

  CI-20190529: 20190529
  CI_DRM_7982: f02659605b48dcabb562bbb96db2996b334e57fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4210: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4210/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
