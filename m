Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 13:42:53 -0000
Message-ID: <158030537394.5460.8765338930866922531@emeril.freedesktop.org>
References: <20200129121602.1106978-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200129121602.1106978-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Fix_is=5Fphysical=5Fengine_advancement?=
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

Series: lib/i915: Fix is_physical_engine advancement
URL   : https://patchwork.freedesktop.org/series/72716/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7836 -> IGTPW_4026
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4026 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4026, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4026:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  
Known issues
------------

  Here are the changes found in IGTPW_4026 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-1024:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([CI#94] / [i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-1024.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-1024.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][4] -> [FAIL][5] ([fdo#111096] / [i915#323])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][6] ([i915#45]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][8] ([CI#94]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][10] ([i915#725]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - fi-tgl-y:           [DMESG-WARN][12] ([CI#94] / [i915#402]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][14] ([i915#725]) -> [DMESG-FAIL][15] ([i915#553] / [i915#725])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7836/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-bsw-kefka 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5402 -> IGTPW_4026

  CI-20190529: 20190529
  CI_DRM_7836: d242b9ae26a7ec6e493823c0b82eed4ff72f4820 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4026: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/index.html
  IGT_5402: ccefe6bf07b075f786d96904e19eaa03695c26d5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4026/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
