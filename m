Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 May 2020 12:15:14 -0000
Message-ID: <158859451483.5816.5672253919574984721@emeril.freedesktop.org>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fcore=3A_Make_assert_?=
 =?utf-8?q?on_invalid_magic_blocks_nesting_more_verbose?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/igt_core: Make assert on invalid magic blocks nesting more verbose
URL   : https://patchwork.freedesktop.org/series/76900/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8417 -> IGTPW_4529
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html

Known issues
------------

  Here are the changes found in IGTPW_4529 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_timelines:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2] ([i915#489])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/fi-bwr-2160/igt@i915_selftest@live@gt_timelines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/fi-bwr-2160/igt@i915_selftest@live@gt_timelines.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][3] ([fdo#109271]) -> [FAIL][4] ([i915#62])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Participating hosts (52 -> 44)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5628 -> IGTPW_4529

  CI-20190529: 20190529
  CI_DRM_8417: 7f9142d29c789842bd79245dd6623df9f15ba746 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4529: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html
  IGT_5628: 652a3fd8966345fa5498904ce80a2027a6782783 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
