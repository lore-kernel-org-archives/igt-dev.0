Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 10:45:30 -0000
Message-ID: <158219553050.17408.6964439605855299621@emeril.freedesktop.org>
References: <20200220094134.1560435-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220094134.1560435-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_igt/kms=5Ffrontbuffer=5Ftracki?=
 =?utf-8?q?ng=3A_Skip_over_IGT=5FDRAW=5FBLT_when_there=27s_no_BLT?=
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

Series: series starting with [i-g-t,1/3] igt/kms_frontbuffer_tracking: Skip over IGT_DRAW_BLT when there's no BLT
URL   : https://patchwork.freedesktop.org/series/73698/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5453 -> IGTPW_4191
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4191 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4191, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4191:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-icl-u2/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-icl-u2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live_gt_mocs:
    - fi-bwr-2160:        [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-bwr-2160/igt@i915_selftest@live_gt_mocs.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-bwr-2160/igt@i915_selftest@live_gt_mocs.html

  
Known issues
------------

  Here are the changes found in IGTPW_4191 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][5] -> [INCOMPLETE][6] ([i915#45])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][7] -> [INCOMPLETE][8] ([i915#45])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][9] -> [INCOMPLETE][10] ([CI#80] / [fdo#106070] / [i915#424])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
    - fi-cml-s:           [PASS][11] -> [DMESG-FAIL][12] ([i915#877])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [PASS][13] -> [FAIL][14] ([i915#34])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-4770:        [PASS][15] -> [FAIL][16] ([i915#49])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gtt:
    - fi-bxt-dsi:         [TIMEOUT][17] ([fdo#112271]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-bxt-dsi/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-bxt-dsi/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [FAIL][19] ([CI#81]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][21] ([CI#81] / [fdo#109635]) -> [PASS][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-7500u:       [FAIL][23] ([CI#81] / [fdo#109635] / [i915#976]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-kbl-7500u/igt@kms_chamelium@dp-edid-read.html
    - fi-icl-u2:          [FAIL][25] ([CI#81] / [fdo#109635]) -> [PASS][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][27] ([CI#81]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-7500u:       [SKIP][29] ([fdo#109271]) -> [PASS][30] +23 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-kbl-7500u/igt@prime_vgem@basic-fence-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-kbl-7500u/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-icl-u2:          [FAIL][31] ([CI#81] / [fdo#109635]) -> [DMESG-WARN][32] ([i915#289])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-icl-u2/igt@kms_chamelium@dp-hpd-fast.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-icl-u2/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][33] ([CI#81]) -> [FAIL][34] ([fdo#111407])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-icl-u2:          [FAIL][35] ([CI#81]) -> [SKIP][36] ([fdo#109309]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-icl-u2/igt@kms_chamelium@vga-hpd-fast.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-icl-u2/igt@kms_chamelium@vga-hpd-fast.html
    - fi-kbl-7500u:       [FAIL][37] ([CI#81]) -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5453/fi-kbl-7500u/igt@kms_chamelium@vga-hpd-fast.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/fi-kbl-7500u/igt@kms_chamelium@vga-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [CI#81]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/81
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (51 -> 47)
------------------------------

  Additional (2): fi-skl-6770hq fi-kbl-7560u 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4191

  CI-20190529: 20190529
  CI_DRM_7971: 9df74cf797a04e60dac4d9f5742481bbfeead8ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4191: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4191/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
