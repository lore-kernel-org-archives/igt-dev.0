Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 10:02:58 -0000
Message-ID: <158711777897.10464.13557052273761817873@emeril.freedesktop.org>
References: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Allow_modeset_to_surivive_change_of_cdclk?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_fb: Allow modeset to surivive change of cdclk
URL   : https://patchwork.freedesktop.org/series/76077/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8314 -> IGTPW_4479
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/index.html

Known issues
------------

  Here are the changes found in IGTPW_4479 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-icl-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#189])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/fi-icl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/fi-icl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-y:           [DMESG-FAIL][3] ([i915#1725]) -> [INCOMPLETE][4] ([i915#1725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/fi-tgl-y/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/fi-tgl-y/igt@i915_selftest@live@gt_pm.html

  
  [i915#1725]: https://gitlab.freedesktop.org/drm/intel/issues/1725
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5598 -> IGTPW_4479

  CI-20190529: 20190529
  CI_DRM_8314: e8a432aa7e81e2bf5b6d4b23e3598f9fea947b83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4479: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/index.html
  IGT_5598: 276b8a3f24837e009ff38512f7eeb07029e52616 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4479/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
