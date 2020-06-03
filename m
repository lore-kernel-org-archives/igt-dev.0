Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 03 Jun 2020 12:27:21 -0000
Message-ID: <159118724188.12266.13089504463456060284@emeril.freedesktop.org>
References: <20200603120900.17672-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200603120900.17672-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_from_media=5Fspin?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Remove libdrm from media_spin
URL   : https://patchwork.freedesktop.org/series/77951/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5694 -> IGTPW_4644
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4644 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4644, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4644:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_sseu@full-enable:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-kbl-soraka/igt@i915_pm_sseu@full-enable.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-skl-6600u/igt@i915_pm_sseu@full-enable.html
    - fi-whl-u:           NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-whl-u/igt@i915_pm_sseu@full-enable.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-cfl-guc/igt@i915_pm_sseu@full-enable.html
    - fi-cml-s:           NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-cml-s/igt@i915_pm_sseu@full-enable.html
    - fi-apl-guc:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-apl-guc/igt@i915_pm_sseu@full-enable.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-bxt-dsi/igt@i915_pm_sseu@full-enable.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-cfl-8700k/igt@i915_pm_sseu@full-enable.html
    - fi-cml-u2:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-cml-u2/igt@i915_pm_sseu@full-enable.html
    - fi-kbl-r:           NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-kbl-r/igt@i915_pm_sseu@full-enable.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-kbl-8809g/igt@i915_pm_sseu@full-enable.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-kbl-guc/igt@i915_pm_sseu@full-enable.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-kbl-7500u/igt@i915_pm_sseu@full-enable.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-cfl-8109u/igt@i915_pm_sseu@full-enable.html
    - fi-skl-guc:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-skl-guc/igt@i915_pm_sseu@full-enable.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-kbl-x1275/igt@i915_pm_sseu@full-enable.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-glk-dsi/igt@i915_pm_sseu@full-enable.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-skl-6700k2/igt@i915_pm_sseu@full-enable.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/fi-skl-lmem/igt@i915_pm_sseu@full-enable.html

  
New tests
---------

  New tests have been introduced between IGT_5694 and IGTPW_4644:

### New IGT tests (1) ###

  * igt@i915_pm_sseu:
    - Statuses :
    - Exec time: [None] s

  



Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5694 -> IGTPW_4644

  CI-20190529: 20190529
  CI_DRM_8575: b261605291bae8f267174f92df7513a3a7184573 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4644: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/index.html
  IGT_5694: a9b6c4c74bfddf7d3d2da3be08804fe315945cea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4644/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
