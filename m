Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 10:52:03 -0000
Message-ID: <158435592376.18996.673781644973810426@emeril.freedesktop.org>
References: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/intel-ci/blacklist=3A_Bl?=
 =?utf-8?q?acklist_kms=5Fchamelium=40hdmi-*-planes-random?=
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

Series: series starting with [i-g-t,1/2] tests/intel-ci/blacklist: Blacklist kms_chamelium@hdmi-*-planes-random
URL   : https://patchwork.freedesktop.org/series/74684/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8134 -> IGTPW_4302
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html

Known issues
------------

  Here are the changes found in IGTPW_4302 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][1] -> [DMESG-FAIL][2] ([fdo#108569])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-icl-y/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([i915#217])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@active:
    - fi-icl-y:           [DMESG-FAIL][5] ([i915#765]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-icl-y/igt@i915_selftest@live@active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-icl-y/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [INCOMPLETE][7] ([fdo#103927] / [i915#656]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@requests:
    - fi-bwr-2160:        [INCOMPLETE][9] ([i915#1457]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-bwr-2160/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-bwr-2160/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [INCOMPLETE][11] ([CI#94] / [i915#460]) -> [FAIL][12] ([CI#94])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][13] ([fdo#111407]) -> [FAIL][14] ([i915#323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#1457]: https://gitlab.freedesktop.org/drm/intel/issues/1457
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765


Participating hosts (44 -> 44)
------------------------------

  Additional (8): fi-kbl-soraka fi-bdw-5557u fi-bsw-n3050 fi-hsw-peppy fi-skl-lmem fi-bsw-nick fi-skl-6600u fi-snb-2600 
  Missing    (8): fi-ilk-m540 fi-ehl-1 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5508 -> IGTPW_4302

  CI-20190529: 20190529
  CI_DRM_8134: 548cc21e9ca596cc12dfdb36575b0fedf28a3eb4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4302: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html
  IGT_5508: 89d644600a1a9f08794cc7106b63758df40ce1d8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@kms_chamelium@dp-link-status

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
