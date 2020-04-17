Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 10:25:44 -0000
Message-ID: <158711914461.10465.15530738298799531176@emeril.freedesktop.org>
References: <20200416131915.533-1-mika.kahola@intel.com>
In-Reply-To: <20200416131915.533-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Wait_for_an_extra_vblank_=28rev6=29?=
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: Wait for an extra vblank (rev6)
URL   : https://patchwork.freedesktop.org/series/75413/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8314 -> IGTPW_4480
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4480/index.html

Known issues
------------

  Here are the changes found in IGTPW_4480 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-icl-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#189])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/fi-icl-dsi/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4480/fi-icl-dsi/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@active:
    - fi-cml-s:           [PASS][3] -> [DMESG-FAIL][4] ([i915#666])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/fi-cml-s/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4480/fi-cml-s/igt@i915_selftest@live@active.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-7500u:       [PASS][5] -> [FAIL][6] ([i915#976])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8314/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4480/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html

  
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5598 -> IGTPW_4480

  CI-20190529: 20190529
  CI_DRM_8314: e8a432aa7e81e2bf5b6d4b23e3598f9fea947b83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4480: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4480/index.html
  IGT_5598: 276b8a3f24837e009ff38512f7eeb07029e52616 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4480/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
