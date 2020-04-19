Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 19 Apr 2020 15:47:53 -0000
Message-ID: <158731127340.15014.17470673778806268538@emeril.freedesktop.org>
References: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVXNlIGRl?=
 =?utf-8?q?vice_dependant_module_parameters?=
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

Series: Use device dependant module parameters
URL   : https://patchwork.freedesktop.org/series/76163/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5601 -> IGTPW_4488
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4488 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4488, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4488:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-hsw-4770:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-hsw-4770/igt@kms_force_connector_basic@force-load-detect.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-hsw-4770/igt@kms_force_connector_basic@force-load-detect.html
    - fi-elk-e7500:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-elk-e7500/igt@kms_force_connector_basic@force-load-detect.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-elk-e7500/igt@kms_force_connector_basic@force-load-detect.html
    - fi-ivb-3770:        [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-ivb-3770/igt@kms_force_connector_basic@force-load-detect.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-ivb-3770/igt@kms_force_connector_basic@force-load-detect.html
    - fi-byt-j1900:       [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-byt-j1900/igt@kms_force_connector_basic@force-load-detect.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-byt-j1900/igt@kms_force_connector_basic@force-load-detect.html
    - fi-blb-e6850:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-blb-e6850/igt@kms_force_connector_basic@force-load-detect.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-blb-e6850/igt@kms_force_connector_basic@force-load-detect.html
    - fi-pnv-d510:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-pnv-d510/igt@kms_force_connector_basic@force-load-detect.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-pnv-d510/igt@kms_force_connector_basic@force-load-detect.html
    - fi-snb-2520m:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-snb-2520m/igt@kms_force_connector_basic@force-load-detect.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-snb-2520m/igt@kms_force_connector_basic@force-load-detect.html
    - fi-gdg-551:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-gdg-551/igt@kms_force_connector_basic@force-load-detect.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-gdg-551/igt@kms_force_connector_basic@force-load-detect.html
    - fi-bwr-2160:        [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-bwr-2160/igt@kms_force_connector_basic@force-load-detect.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-bwr-2160/igt@kms_force_connector_basic@force-load-detect.html
    - fi-snb-2600:        [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-snb-2600/igt@kms_force_connector_basic@force-load-detect.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-snb-2600/igt@kms_force_connector_basic@force-load-detect.html

  
Known issues
------------

  Here are the changes found in IGTPW_4488 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [PASS][21] -> [DMESG-WARN][22] ([i915#203])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-skl-6770hq/igt@i915_module_load@reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-skl-6770hq:      [PASS][23] -> [SKIP][24] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6770hq:      [PASS][25] -> [DMESG-FAIL][26] ([i915#165])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-skl-6770hq/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-skl-6770hq/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][27] ([i915#178]) -> [DMESG-WARN][28] ([i915#203])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5601/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203


Participating hosts (50 -> 45)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5601 -> IGTPW_4488

  CI-20190529: 20190529
  CI_DRM_8324: 279672c3e0717ef7047b97b49d98636ef2242a91 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4488: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/index.html
  IGT_5601: d3422eb9bfbebab8a97687bf29552a471473963b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4488/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
