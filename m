Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 13:29:23 -0000
Message-ID: <158592056390.13349.11105169376036330321@emeril.freedesktop.org>
References: <20200403114727.27760-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200403114727.27760-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?ix_device_lists_not_cleaned_up_sufficiently_before_rescan_=28re?=
 =?utf-8?b?djIp?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Fix device lists not cleaned up sufficiently before rescan (rev2)
URL   : https://patchwork.freedesktop.org/series/74929/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5561 -> IGTPW_4401
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4401 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4401, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4401:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-guc:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/fi-kbl-guc/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/fi-kbl-guc/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_4401 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-blb-e6850:       [PASS][3] -> [DMESG-WARN][4] ([i915#1612])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-7500u:       [PASS][5] -> [FAIL][6] ([i915#976])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * {igt@gem_wait@busy@all}:
    - fi-byt-n2820:       [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/fi-byt-n2820/igt@gem_wait@busy@all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/fi-byt-n2820/igt@gem_wait@busy@all.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-r:           [INCOMPLETE][9] ([CI#80] / [i915#656]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/fi-kbl-r/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/fi-kbl-r/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [i915#1612]: https://gitlab.freedesktop.org/drm/intel/issues/1612
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (49 -> 45)
------------------------------

  Additional (2): fi-snb-2520m fi-bsw-n3050 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5561 -> IGTPW_4401

  CI-20190529: 20190529
  CI_DRM_8244: 55348aac86bd6f0c4ce4d3d8a0e227f6a20a72f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4401: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/index.html
  IGT_5561: 860a72c190aa9246055f20ac87a02a26fe1842e8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
