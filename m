Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 15:12:07 -0000
Message-ID: <158272992742.21009.11756424789831192944@emeril.freedesktop.org>
References: <20200225112218.1532204-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200225112218.1532204-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_return_NULL_when_platform_is_not_supported?=
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

Series: lib/i915/perf: return NULL when platform is not supported
URL   : https://patchwork.freedesktop.org/series/73896/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8004_full -> IGTPW_4221_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4221_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4221_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4221_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/shard-tglb2/igt@i915_pm_rpm@fences.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/shard-tglb6/igt@i915_pm_rpm@fences.html

  
Known issues
------------

  Here are the changes found in IGTPW_4221_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#1149])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/shard-tglb1/igt@kms_color@pipe-a-gamma.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/shard-tglb2/igt@kms_color@pipe-a-gamma.html

  
#### Possible fixes ####

  * igt@gem_exec_async@concurrent-writes-blt:
    - shard-tglb:         [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/shard-tglb6/igt@gem_exec_async@concurrent-writes-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/shard-tglb8/igt@gem_exec_async@concurrent-writes-blt.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [SKIP][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/shard-tglb5/igt@i915_pm_rpm@pm-tiling.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][9] ([i915#454]) -> [SKIP][10] ([i915#468])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][11] ([i915#1233]) -> [DMESG-FAIL][12] ([i915#1233])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/shard-tglb1/igt@i915_selftest@live_gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/shard-tglb8/igt@i915_selftest@live_gt_lrc.html

  
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5464 -> IGTPW_4221

  CI-20190529: 20190529
  CI_DRM_8004: 1a2e0cce5af4a9ad9694995610ed64578ccc430f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4221: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/index.html
  IGT_5464: 8cf2f8684992052ab89de1cf328c418224c0c2a7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
