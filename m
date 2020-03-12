Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Mar 2020 10:47:43 -0000
Message-ID: <158401006340.4948.4521090663125655960@emeril.freedesktop.org>
References: <20200312095137.551252-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200312095137.551252-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fchamelium=3A_Don?=
 =?utf-8?q?=27t_use_CCS_modifiers_in_random_plane_setup?=
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

Series: series starting with [i-g-t,1/2] tests/kms_chamelium: Don't use CCS modifiers in random plane setup
URL   : https://patchwork.freedesktop.org/series/74635/
State : success

== Summary ==

CI Bug Log - changes from IGT_5506 -> IGTPW_4296
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4296/index.html

Known issues
------------

  Here are the changes found in IGTPW_4296 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#1430] / [i915#58] / [k.org#198133])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4296/fi-glk-dsi/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@active:
    - fi-bxt-dsi:         [DMESG-FAIL][3] ([i915#666]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-bxt-dsi/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4296/fi-bxt-dsi/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-skl-6770hq:      [INCOMPLETE][5] ([i915#1430]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-skl-6770hq/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4296/fi-skl-6770hq/igt@i915_selftest@live@execlists.html

  
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (47 -> 40)
------------------------------

  Missing    (7): fi-kbl-soraka fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-elk-e7500 fi-kbl-7560u fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5506 -> IGTPW_4296

  CI-20190529: 20190529
  CI_DRM_8126: 2bd9e989a5653d4cd710e9dd2b42b0a080f1add8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4296: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4296/index.html
  IGT_5506: 59fd8a0d01dac58dc6c7d86ef391ed4393ab5aae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4296/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
