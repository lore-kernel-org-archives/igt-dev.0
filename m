Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 25 Feb 2020 12:26:55 -0000
Message-ID: <158263361564.5723.17782515955513982873@emeril.freedesktop.org>
References: <20200225112218.1532204-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200225112218.1532204-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_return_NULL_when_platform_is_not_supported?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/perf: return NULL when platform is not supported
URL   : https://patchwork.freedesktop.org/series/73896/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8004 -> IGTPW_4221
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/index.html

Known issues
------------

  Here are the changes found in IGTPW_4221 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@vgem_basic@unload:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/fi-tgl-y/igt@vgem_basic@unload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/fi-tgl-y/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [INCOMPLETE][3] ([i915#140]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/fi-icl-y/igt@i915_selftest@live_execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][5] ([i915#217] / [i915#976]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [DMESG-WARN][7] ([CI#94] / [i915#402]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8004/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (43 -> 45)
------------------------------

  Additional (7): fi-ehl-1 fi-ilk-650 fi-snb-2520m fi-gdg-551 fi-elk-e7500 fi-blb-e6850 fi-skl-6600u 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5464 -> IGTPW_4221

  CI-20190529: 20190529
  CI_DRM_8004: 1a2e0cce5af4a9ad9694995610ed64578ccc430f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4221: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/index.html
  IGT_5464: 8cf2f8684992052ab89de1cf328c418224c0c2a7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4221/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
