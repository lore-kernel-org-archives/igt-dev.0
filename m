Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 12:15:14 -0000
Message-ID: <158271931403.21010.15580429604951810084@emeril.freedesktop.org>
References: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/9=5D_lib/tests=3A_Extract_fork_help?=
 =?utf-8?q?ers?=
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

Series: series starting with [i-g-t,1/9] lib/tests: Extract fork helpers
URL   : https://patchwork.freedesktop.org/series/73920/
State : success

== Summary ==

CI Bug Log - changes from IGT_5467 -> IGTPW_4223
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/index.html

Known issues
------------

  Here are the changes found in IGTPW_4223 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][1] -> [FAIL][2] ([i915#217])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([fdo#111407])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-pnv-d510:        [SKIP][5] ([fdo#109271] / [fdo#111827]) -> [SKIP][6] ([fdo#109271]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bwr-2160:        [SKIP][7] ([fdo#109271] / [fdo#111827]) -> [SKIP][8] ([fdo#109271]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-bwr-2160/igt@kms_chamelium@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-bwr-2160/igt@kms_chamelium@dp-crc-fast.html
    - fi-gdg-551:         [SKIP][9] ([fdo#109271] / [fdo#111827]) -> [SKIP][10] ([fdo#109271]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-gdg-551/igt@kms_chamelium@dp-crc-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-gdg-551/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-blb-e6850:       [SKIP][11] ([fdo#109271] / [fdo#111827]) -> [SKIP][12] ([fdo#109271]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-blb-e6850/igt@kms_chamelium@hdmi-edid-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-blb-e6850/igt@kms_chamelium@hdmi-edid-read.html
    - fi-kbl-8809g:       [SKIP][13] ([fdo#109271] / [fdo#111827]) -> [SKIP][14] ([fdo#109271]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217


Participating hosts (49 -> 45)
------------------------------

  Additional (1): fi-tgl-y 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5467 -> IGTPW_4223

  CI-20190529: 20190529
  CI_DRM_8005: 81f641f60edbfa1ccb169689206f0af360a06e31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4223: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/index.html
  IGT_5467: 2684f182424582c66e67bcbbda77cd60901627b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@meta_test@abort

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
