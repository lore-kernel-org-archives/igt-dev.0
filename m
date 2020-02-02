Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Feb 2020 19:28:47 -0000
Message-ID: <158067172744.17037.6628347544418283062@emeril.freedesktop.org>
References: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBL?=
 =?utf-8?q?ill_residual_children_at_the_end_of_a_subtest?=
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

Series: lib: Kill residual children at the end of a subtest
URL   : https://patchwork.freedesktop.org/series/72885/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7857 -> IGTPW_4072
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4072 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4072, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4072:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_execlists:
    - fi-kbl-x1275:       [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-kbl-x1275/igt@i915_selftest@live_execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-kbl-x1275/igt@i915_selftest@live_execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_4072 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][3] -> [FAIL][4] ([i915#217] / [i915#976])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-4770:        [PASS][5] -> [FAIL][6] ([i915#49])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][7] ([i915#553] / [i915#725]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][9] ([i915#553] / [i915#725]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [INCOMPLETE][11] ([fdo#106070] / [i915#424]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][13] ([fdo#111096] / [i915#323]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][15] ([i915#694]) -> [TIMEOUT][16] ([fdo#112271] / [i915#1084])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7857/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 43)
------------------------------

  Additional (4): fi-skl-6770hq fi-bdw-5557u fi-bwr-2160 fi-bsw-nick 
  Missing    (8): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-whl-u fi-blb-e6850 fi-byt-clapper fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5411 -> IGTPW_4072

  CI-20190529: 20190529
  CI_DRM_7857: 8ec40a15b9a930df9e445f17c5e01cdb6f80353a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4072: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/index.html
  IGT_5411: 86c6ab8a0b6696bdb2153febd350af7fa02fbb00 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4072/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
