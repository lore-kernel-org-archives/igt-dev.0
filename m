Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 14:39:56 -0000
Message-ID: <158013599695.9684.12776077353968291438@emeril.freedesktop.org>
References: <20200127084610.29356-1-ramalingam.c@intel.com>
In-Reply-To: <20200127084610.29356-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fcreate=3A_Remove_page_nonaligned_buffer_tests?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_create: Remove page nonaligned buffer tests
URL   : https://patchwork.freedesktop.org/series/72603/
State : success

== Summary ==

CI Bug Log - changes from IGT_5387 -> IGTPW_3998
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/index.html

Known issues
------------

  Here are the changes found in IGTPW_3998 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][3] -> [DMESG-WARN][4] ([i915#889])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [PASS][5] -> [DMESG-FAIL][6] ([i915#723])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-bsw-nick/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bsw-nick:        [PASS][7] -> [DMESG-FAIL][8] ([i915#541])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-bsw-nick/igt@i915_selftest@live_gt_heartbeat.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-bsw-nick/igt@i915_selftest@live_gt_heartbeat.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][9] -> [DMESG-WARN][10] ([i915#44])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-icl-dsi:         [PASS][11] -> [DMESG-WARN][12] ([i915#109])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-icl-dsi/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-icl-dsi/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][13] ([i915#553] / [i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][15] ([i915#725]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][17] ([fdo#111407]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (49 -> 44)
------------------------------

  Additional (1): fi-apl-guc 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5387 -> IGTPW_3998

  CI-20190529: 20190529
  CI_DRM_7816: 713d2a22a63ee93c0afea9a83c332f52ef90e91a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3998: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/index.html
  IGT_5387: 2e04a36cb5eba1a979bce80b58c35687f324f066 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_create@create-invalid-nonaligned
-igt@gem_create@create-valid-nonaligned

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3998/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
