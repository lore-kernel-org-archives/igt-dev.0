Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Feb 2020 16:38:26 -0000
Message-ID: <158152550673.24265.11461629216564752453@emeril.freedesktop.org>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWJvcnQg?=
 =?utf-8?q?on_Chamelium_failure?=
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

Series: Abort on Chamelium failure
URL   : https://patchwork.freedesktop.org/series/73358/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7922 -> IGTPW_4137
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/index.html

Known issues
------------

  Here are the changes found in IGTPW_4137 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][3] -> [DMESG-FAIL][4] ([fdo#108569])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-icl-y/igt@i915_selftest@live_execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [PASS][5] -> [DMESG-FAIL][6] ([i915#722])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
    - fi-cml-s:           [PASS][7] -> [DMESG-FAIL][8] ([i915#877])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][9] -> [FAIL][10] ([i915#217])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - {fi-ehl-1}:         [INCOMPLETE][11] ([i915#937]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-ehl-1/igt@gem_exec_parallel@contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-ehl-1/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [TIMEOUT][13] ([fdo#112271]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-kbl-7500u/igt@i915_selftest@live_gtt.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-pnv-d510:        [SKIP][15] ([fdo#109271] / [fdo#111827]) -> [SKIP][16] ([fdo#109271]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-blb-e6850:       [SKIP][17] ([fdo#109271] / [fdo#111827]) -> [SKIP][18] ([fdo#109271]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-blb-e6850/igt@kms_chamelium@dp-crc-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-blb-e6850/igt@kms_chamelium@dp-crc-fast.html
    - fi-gdg-551:         [SKIP][19] ([fdo#109271] / [fdo#111827]) -> [SKIP][20] ([fdo#109271]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-gdg-551/igt@kms_chamelium@dp-crc-fast.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-gdg-551/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-8809g:       [SKIP][21] ([fdo#109271] / [fdo#111827]) -> [SKIP][22] ([fdo#109271]) +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bwr-2160:        [SKIP][23] ([fdo#109271] / [fdo#111827]) -> [SKIP][24] ([fdo#109271]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7922/fi-bwr-2160/igt@kms_chamelium@vga-edid-read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/fi-bwr-2160/igt@kms_chamelium@vga-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (53 -> 44)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (10): fi-cml-u2 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-icl-u2 fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5436 -> IGTPW_4137

  CI-20190529: 20190529
  CI_DRM_7922: 0367f4b85f1fbbb1f0df1064803c97d35ed53f24 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4137: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/index.html
  IGT_5436: 00a64098aaae2ac3154841d76c7b034165380282 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4137/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
