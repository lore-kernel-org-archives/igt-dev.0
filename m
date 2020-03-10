Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Mar 2020 17:00:48 -0000
Message-ID: <158385964805.5456.9210729658156579964@emeril.freedesktop.org>
References: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/perf=3A_remove_genera?=
 =?utf-8?q?tion_code_for_mathml_render?=
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

Series: series starting with [i-g-t,1/2] lib/i915/perf: remove generation code for mathml render
URL   : https://patchwork.freedesktop.org/series/74528/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8106 -> IGTPW_4286
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/index.html

Known issues
------------

  Here are the changes found in IGTPW_4286 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-icl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#184])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/fi-icl-guc/igt@gem_exec_suspend@basic-s4-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/fi-icl-guc/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [PASS][3] -> [DMESG-FAIL][4] ([i915#877])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-open:
    - fi-tgl-y:           [DMESG-WARN][7] ([CI#94] / [i915#402]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/fi-tgl-y/igt@gem_flink_basic@bad-open.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/fi-tgl-y/igt@gem_flink_basic@bad-open.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#184]: https://gitlab.freedesktop.org/drm/intel/issues/184
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (44 -> 41)
------------------------------

  Additional (5): fi-bdw-5557u fi-kbl-7500u fi-cfl-8109u fi-skl-6600u fi-snb-2600 
  Missing    (8): fi-hsw-4200u fi-skl-6770hq fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bsw-nick fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4286

  CI-20190529: 20190529
  CI_DRM_8106: 5b0076e8066ea8218e7857ee1aa28b0670acde94 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4286: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
