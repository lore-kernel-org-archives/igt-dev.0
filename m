Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 16:04:54 -0000
Message-ID: <158221469423.17406.5171148844349402682@emeril.freedesktop.org>
References: <20200220153203.29571-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200220153203.29571-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Restrict_mmap_types_to_GTT_if_no_MMAP=5FOFFSET_support?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915: Restrict mmap types to GTT if no MMAP_OFFSET support
URL   : https://patchwork.freedesktop.org/series/73719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973 -> IGTPW_4198
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7973 and IGTPW_4198:

### New IGT tests (4) ###

  * igt@i915_pm_backlight@basic-brightness:
    - Statuses : 1 dmesg-warn(s) 17 pass(s) 23 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 dmesg-warn(s) 29 pass(s) 11 skip(s)
    - Exec time: [0.0, 10.49] s

  * igt@i915_pm_rpm@basic-rte:
    - Statuses : 1 dmesg-warn(s) 29 pass(s) 11 skip(s)
    - Exec time: [0.44, 11.29] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 36 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4198 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@i915_selftest@live_execlists:
    - fi-tgl-y:           [PASS][5] -> [INCOMPLETE][6] ([CI#94] / [i915#647])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-tgl-y/igt@i915_selftest@live_execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][7] ([i915#877]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][9] ([i915#217]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][11] ([CI#94] / [i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][13] ([fdo#109315]) -> [SKIP][14] ([fdo#109315] / [i915#585])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][15] ([fdo#111407]) -> [FAIL][16] ([fdo#111096] / [i915#323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (49 -> 46)
------------------------------

  Additional (4): fi-kbl-soraka fi-skl-lmem fi-ivb-3770 fi-pnv-d510 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4198

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4198: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
