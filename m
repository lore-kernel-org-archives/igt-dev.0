Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 18 May 2020 23:06:36 -0000
Message-ID: <158984319638.31688.7454146415378640045@emeril.freedesktop.org>
References: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBD?=
 =?utf-8?b?bGVhbnVwIF9faWd0X3BhcmFtc19vcGVuKCkgKHJldjMp?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Cleanup __igt_params_open() (rev3)
URL   : https://patchwork.freedesktop.org/series/77374/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8498 -> IGTPW_4578
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4578 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4578, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4578:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-elk-e7500:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-elk-e7500/igt@kms_force_connector_basic@force-load-detect.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-elk-e7500/igt@kms_force_connector_basic@force-load-detect.html
    - fi-ivb-3770:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-ivb-3770/igt@kms_force_connector_basic@force-load-detect.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-ivb-3770/igt@kms_force_connector_basic@force-load-detect.html
    - fi-byt-j1900:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-byt-j1900/igt@kms_force_connector_basic@force-load-detect.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-byt-j1900/igt@kms_force_connector_basic@force-load-detect.html
    - fi-blb-e6850:       [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-blb-e6850/igt@kms_force_connector_basic@force-load-detect.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-blb-e6850/igt@kms_force_connector_basic@force-load-detect.html
    - fi-ilk-650:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-ilk-650/igt@kms_force_connector_basic@force-load-detect.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-ilk-650/igt@kms_force_connector_basic@force-load-detect.html
    - fi-pnv-d510:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-pnv-d510/igt@kms_force_connector_basic@force-load-detect.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-pnv-d510/igt@kms_force_connector_basic@force-load-detect.html
    - fi-snb-2520m:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-snb-2520m/igt@kms_force_connector_basic@force-load-detect.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-snb-2520m/igt@kms_force_connector_basic@force-load-detect.html
    - fi-gdg-551:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-gdg-551/igt@kms_force_connector_basic@force-load-detect.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-gdg-551/igt@kms_force_connector_basic@force-load-detect.html
    - fi-bwr-2160:        [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bwr-2160/igt@kms_force_connector_basic@force-load-detect.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-bwr-2160/igt@kms_force_connector_basic@force-load-detect.html
    - fi-snb-2600:        [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-snb-2600/igt@kms_force_connector_basic@force-load-detect.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-snb-2600/igt@kms_force_connector_basic@force-load-detect.html

  
Known issues
------------

  Here are the changes found in IGTPW_4578 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-whl-u:           [PASS][21] -> [INCOMPLETE][22] ([i915#656])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-whl-u/igt@i915_selftest@live@execlists.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/fi-whl-u/igt@i915_selftest@live@execlists.html

  
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (52 -> 44)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-hsw-4770 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4578

  CI-20190529: 20190529
  CI_DRM_8498: 1493c649ae92207a758afa50a639275bd6c80e2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4578: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4578/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
