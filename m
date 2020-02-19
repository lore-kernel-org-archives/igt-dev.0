Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 14:49:43 -0000
Message-ID: <158212378380.21062.14698763943628293698@emeril.freedesktop.org>
References: <20200219133855.67829-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219133855.67829-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdHMvY29y?=
 =?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: ts/core_setmaster: new test for drop/set master semantics
URL   : https://patchwork.freedesktop.org/series/73650/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7964 -> IGTPW_4185
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/index.html

Known issues
------------

  Here are the changes found in IGTPW_4185 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][3] -> [DMESG-FAIL][4] ([i915#623])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770r:       [TIMEOUT][5] ([fdo#112271] / [i915#1084]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/fi-hsw-4770r/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [TIMEOUT][7] ([fdo#112271]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/fi-kbl-7500u/igt@i915_selftest@live_gtt.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][9] ([fdo#109315] / [i915#585]) -> [SKIP][10] ([fdo#109315])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#623]: https://gitlab.freedesktop.org/drm/intel/issues/623


Participating hosts (49 -> 45)
------------------------------

  Additional (2): fi-hsw-4770 fi-snb-2520m 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5450 -> IGTPW_4185

  CI-20190529: 20190529
  CI_DRM_7964: af0d76d734234d537d1ed6bebfc2f55c88ea2a49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4185: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/index.html
  IGT_5450: dfba090e720ed4e043158887f1ba6a76059491e8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_setmaster@master-drop-set-root
+igt@core_setmaster@master-drop-set-shared-fd
+igt@core_setmaster@master-drop-set-user

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
